class Requisition < ApplicationRecord
  belongs_to :requester, class_name: :User
  belongs_to :requisition_status
  belongs_to :requisition_category
  belongs_to :client
  belongs_to :modality
  belongs_to :sector_flow
  belongs_to :location
  has_many_attached :files
  before_validation :set_status, on: :create
  before_save :end_game
  enum flag: [ :open, :closed, :inprogress, :canceled ]

  scope :final_steps, -> { where "(sector_flow_id = ? and requisition_category_id = ?)or(sector_flow_id = ? and requisition_category_id = ?)", 4,2,9,1}
  scope :closed, -> { where "sector_flow_id > ? or sector_flow_id < ?", 9,1}
  scope :opened, -> { where "sector_flow_id <= ? and sector_flow_id >= ?", 9,1}
  
  
  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%")
    else
      all
    end
  end

  def self.find_by_date
    self.where(updated_at: 1.month.ago .. Date.today)
  end

  def crl
    if self.requisition_category_id == 2 
      true
    end
  end

  def can_approve
   if self.sector_flow_id == 4
      true
   end
  end

  def can_archive
    if self.crl && self.sector_flow_id == 4
      true
    elsif self.sector_flow_id == 9
      true
    end
  end

  def closed
    if self.sector_flow_id > 9 || self.sector_flow_id < 1
      true
    else
      false
    end
  end

  def unclosed 
    if self.closed
      false
    else
      true
    end
  end

  def self.open_or_closed(filter)
    if filter=="closed"
      self.closed
    else
      self.opened
   end
  end

  def self.volum_by_type    
    RequisitionCategory.select(:id,:name).distinct.map do |category|
      value = 0.0
      Requisition.select(:value, :requisition_category_id).where(requisition_category_id: category.id).each {|item| value += item.value}
      [category.name, value.round(2)]
    end
  end


  private
  def set_status
    self.sector_flow_id = SectorFlow.where(position: 1).first.id
    self.requisition_status_id = 1
  end

  def end_game
    if self.closed 
      self.requisition_status_id = RequisitionStatus.where(name: self.sector_flow.name).first.id
    end
  end
  
end

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
  enum flag: [ :open, :closed, :inprogress, :canceled ]
  
  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%")
    else
      all
    end
  end

  def self.open_or_closed(filter)
    if filter=="closed"
      where(requisition_status_id: 7)
    else
      where.not(requisition_status_id: 7)
    end
  end

  private
  def set_status
    self.sector_flow_id = SectorFlow.where(position: 2).first.id
    self.requisition_status_id = 1
  end

  
end

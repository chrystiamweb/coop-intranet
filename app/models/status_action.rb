class StatusAction < ApplicationRecord
  belongs_to :requisition
  belongs_to :sector_flow
  belongs_to :requisition_status

  scope :closed , -> {where.not(finish: nil)}
  scope :not_closed , -> {where(finish: nil)}
  scope :opened, -> { where "sector_flow_id <= ? and sector_flow_id >= ?", 9,1}

  def self.actions_by_analysts
    self.where(action_by: User.analysts).closed.group(:action_by).count.collect {|data| [data[0] ,(data[1]/2)]}
  end
  def self.last_month_data
    self.where(updated_at: 1.month.ago .. Date.today)
  end
end

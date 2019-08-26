class StatusAction < ApplicationRecord
  belongs_to :requisition
  belongs_to :sector_flow
  belongs_to :requisition_status

  scope :closed , -> {where.not(finish: nil)}

  def self.actions_by_analysts
    self.where(action_by: User.analysts).closed.group(:action_by).count.collect {|data| [data[0] ,(data[1]/2)]}
  end
end

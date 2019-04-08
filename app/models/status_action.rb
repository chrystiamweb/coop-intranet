class StatusAction < ApplicationRecord
  belongs_to :requisition
  belongs_to :sector_flow
  belongs_to :requisition_status

  scope :closed , -> {where.not(finish: nil)}
end

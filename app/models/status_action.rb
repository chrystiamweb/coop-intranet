class StatusAction < ApplicationRecord
  belongs_to :requisition
  belongs_to :requisition_status
end

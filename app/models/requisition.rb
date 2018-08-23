class Requisition < ApplicationRecord
  belongs_to :requisition_status
  belongs_to :requisition_category
end

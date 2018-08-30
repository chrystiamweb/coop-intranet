class Requisition < ApplicationRecord
  belongs_to :requester, class_name: :User
  belongs_to :requisition_status
  belongs_to :requisition_category
end

class CreditLineParam < ApplicationRecord
  belongs_to :client_type
  belongs_to :credit_type
end

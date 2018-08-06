class CreditLine < ApplicationRecord
  belongs_to :credit_type
  enum client_type: [:'PF', :'PJ']
end

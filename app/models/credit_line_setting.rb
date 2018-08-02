class CreditLineSetting < ApplicationRecord
  belongs_to :credit_line
  enum deadline_setup: [:meses, :dias]
end

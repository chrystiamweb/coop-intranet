class CreditLineSetting < ApplicationRecord
  belongs_to :credit_line
  enum deadline_setup: [:meses, :dias]
  enum client_type: [:'Pessoa Física', :'Pessoa Juridica']
end

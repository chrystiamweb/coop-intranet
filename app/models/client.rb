class Client < ApplicationRecord
  belongs_to :location
  validates :name, presence: true
  validates :cpfcnpj, presence: true, length: { maximum: 14 }
end

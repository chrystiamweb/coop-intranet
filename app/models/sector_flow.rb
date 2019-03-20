class SectorFlow < ApplicationRecord
  belongs_to :sector
  has_many :requisitions
  has_many :status_actions
end

class SectorFlow < ApplicationRecord
  belongs_to :sector
  has_many :requisitions
  has_many :status_actions

  scope :crl_flow, -> { where "position <= ?", 4 }
  scope :default_flow, -> { where "position <= ?", 8 }
  scope :deny_option, -> {  where "position = ?", 10 }
  scope :archive_option, -> {  where "position = ?", 9 }
  scope :by_status, -> status { where.not(id: status) }
  

end

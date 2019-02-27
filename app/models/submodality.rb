class Submodality < ApplicationRecord
  belongs_to :modality
  validates :modality, presence: true
  validates :title, presence: true
end

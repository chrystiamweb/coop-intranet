class Sector < ApplicationRecord
    validates :name, presence: true
    has_many :user
    has_many :requisitions
end

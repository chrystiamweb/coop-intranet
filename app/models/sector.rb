class Sector < ApplicationRecord
    validates :name, presence: true
    has_many :users
    has_many :requisitions
end

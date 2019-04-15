class Location < ApplicationRecord
    validates :name, presence: true
    has_many :users

    def self.find_by_number(number)
        self.where(name:"PA#{number}")
    end
end

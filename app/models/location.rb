class Location < ApplicationRecord
    validates :name, presence: true 
    validates :name, uniqueness: true
    has_many :users

    def self.find_by_number(number)
        self.where(name:"PA#{number}")
    end

    def self.last_location
        self.where(name: 'PA99').first
    end

end

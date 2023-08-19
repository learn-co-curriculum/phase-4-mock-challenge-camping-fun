class Camper < ApplicationRecord
    has_many :signups, dependent: :destroy
    has_many :activities, through: :signups

    validates :name, presence:true
    validates :age, numericality: {greater_than_or_equal_to: 8, less_than_or_equal_to: 18}
end

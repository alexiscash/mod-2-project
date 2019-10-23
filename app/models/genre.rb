class Genre < ApplicationRecord
    has_many :writers
    has_many :titles, through: :writers

    validates :name, presence: true
    validates :name, uniqueness: true
end

class Title < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews
    belongs_to :writer

    validates :name, presence: true
    validates :name, uniqueness: true
end

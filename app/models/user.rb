class User < ApplicationRecord
    has_many :reviews
    has_many :titles, through: :reviews

    validates :user_name, presence: true
    validates :user_name, uniqueness: true
    validates :password, presence: true
end

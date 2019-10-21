class User < ApplicationRecord
    has_many :reviews
    has_many :titles, through: :reviews
end

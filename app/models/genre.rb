class Genre < ApplicationRecord
    has_many :writers
    has_many :titles, through: :writers 
end

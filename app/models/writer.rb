class Writer < ApplicationRecord
    has_many :titles
    belongs_to :genre 
end

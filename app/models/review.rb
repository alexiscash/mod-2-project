class Review < ApplicationRecord
    belongs_to :title
    belongs_to :user

    validates :content, presence: true
end

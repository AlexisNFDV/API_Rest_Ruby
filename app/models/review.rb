class Review < ApplicationRecord
    belongs_to :computer
    validates :title, :content, presence: true
end

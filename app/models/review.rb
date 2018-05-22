class Review < ApplicationRecord
  belongs_to :user
  belongs_to :tour
  has_many :comments
  has_many :likes
end

class Tour < ApplicationRecord
  belongs_to :category
  has_many :description_details
  has_many :reviews
end

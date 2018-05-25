class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :description_detail

  scope :created_at_sort, ->{order created_at: :desc}
end

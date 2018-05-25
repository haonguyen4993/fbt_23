class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :description_detail

  scope :created_at_sort, ->{order created_at: :desc}

  enum status: {pending: 0, accept: 1, reject: 2}
end

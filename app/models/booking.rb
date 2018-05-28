class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :description_detail

  validate :booking_expire, on: :update

  scope :created_at_sort, ->{order created_at: :desc}

  enum status: {pending: 0, accepted: 1, rejected: 2}

  def total
    price * quantity
  end

  def booking_expire
    if created_at > description_detail.start_day && self.accepted? || self.pending?
      errors.add :expire, I18n.t("alert.booking_expired")
    end
  end
end

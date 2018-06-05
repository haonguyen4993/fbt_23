class DescriptionDetail < ApplicationRecord
  belongs_to :tour
  has_many :bookings

  validates :price, presence: true,
    numericality: {greater_than_or_equal_to: Settings.description_details.limit_price}
  validates :start_day, presence: true
  validates :end_day, presence: true
  validate :check_day, on: [:update, :create]

  scope :available, ->{where deleted: false}
  scope :check_pending_booking, ->(id, status) do
    where "description_details.id = ? AND bookings.status = ?", id, status
  end

  def check_day
    if !start_day.nil? && !end_day.nil? && start_day > end_day
      errors.add :error, I18n.t("error_check_day")
    end
  end

  def pending_booking? id
    DescriptionDetail.joins(:bookings).check_pending_booking(id, :pending).any?
  end
end

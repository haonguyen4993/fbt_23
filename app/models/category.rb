class Category < ApplicationRecord
  has_many :childs, class_name: Category.name, foreign_key: :parent_id
  belongs_to :parent, class_name: Category.name, optional: true
  has_many :tours, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: {case_sensitive: false}

  acts_as_paranoid

  scope :super, ->{where parent_id: nil}
  scope :booking_by_id_and_status, ->(id, status) do
    joins(tours: {description_details: :bookings})
      .where "categories.id = ? AND bookings.status = ?", id, status
  end
end

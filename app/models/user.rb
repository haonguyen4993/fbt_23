class User < ApplicationRecord
  has_many :reviews
  has_many :bookings
  has_many :comments
  has_many :likes
  has_many :ratings

  devise :database_authenticatable, :registerable, :recoverable,
    :rememberable, :validatable

  enum role: {admin: 1, customer: 0}
end

class Tour < ApplicationRecord
  belongs_to :category
  has_many :description_details
  has_many :reviews

  scope :name_sort, ->{order "name asc"}
  scope :newest_tour, ->{order "created_at desc"}
  scope :recommended_tour, ->{order "rating desc"}
  scope :select_tours_by_category, ->(category_id){where category_id: category_id}
  scope :except_id, ->(id){where.not id: id}
end

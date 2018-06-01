class Tour < ApplicationRecord
  belongs_to :category
  has_many :description_details
  has_many :reviews
  has_many :ratings

  scope :name_sort, ->{order "name asc"}
  scope :newest_tour, ->{order "created_at desc"}
  scope :recommended_tour, ->{order "rating desc"}
  scope :select_tours_by_category, ->(category_id){where category_id: category_id}
  scope :except_id, ->(id){where.not id: id}
  scope :search_by_tour_name, ->(name){where "name LIKE ?", "%#{name}%"}

  def update_rating_average
    rating_average = ratings.any? ? ratings.average(:point).to_i : 0
    self.update_attributes rating: rating_average
  end
end

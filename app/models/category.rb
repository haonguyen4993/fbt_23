class Category < ApplicationRecord
  has_many :child, class_name: Category.name, foreign_key: :parent_id
  belongs_to :parent, class_name: Category.name, optional: true
  has_many :tours
end

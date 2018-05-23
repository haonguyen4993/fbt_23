class Category < ApplicationRecord
  has_many :childs, class_name: Category.name, foreign_key: :parent_id
  belongs_to :parent, class_name: Category.name, optional: true
  has_many :tours

  scope :super, ->{where parent_id: nil}
end

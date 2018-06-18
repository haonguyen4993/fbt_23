require "rails_helper"

describe Category do
  it do
    is_expected.to validate_presence_of(:name)
      .with_message I18n.t "activerecord.errors.models.category.attributes.name.blank"
  end

  it do
    is_expected.to validate_uniqueness_of(:name)
      .case_insensitive
      .with_message I18n.t "activerecord.errors.models.category.attributes.name.unique"
  end

  it {is_expected.to have_many :childs}
  it {is_expected.to belong_to :parent}
  it {is_expected.to have_many :tours}

  describe ".super" do
    it "returns an array of categories that don't have parent category" do
      cate_a = create :category, name: Faker::Name.name, parent_id: nil
      cate_b = create :category, name: Faker::Name.name,
        parent_id: Faker::Number.between(1, Category.all.count)
      cate_c = create :category, name: Faker::Name.name, parent_id: nil
      expect(Category.super).to eq [cate_a, cate_c]
    end
  end
end

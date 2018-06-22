require "rails_helper"

describe "tours/show.html.erb" do
  let(:tour) {create :tour}
  let(:description_details) {tour.description_details}
  let(:review) {create :review, tour: tour}
  let(:user) {create :user}

  shared_examples "guest user" do
    it "renders banner" do
      expect(view).to render_template(partial: "share/_banner")
    end
    it "displays tour name", skip_before: true do
      render  "share/banner"
      expect(rendered).to have_content tour.name
    end
    it "displays tour short description" do
      expect(rendered).to have_content tour.short_description
    end
    it "displays tour content" do
      expect(rendered).to have_content tour.content
    end
    it "renders _detail partial for each tour's description detail" do
      expect(view).to render_template(partial: "_detail", count: description_details.count)
    end
    it "renders _review partial for each tour's review" do
      expect(view).to render_template(partial: "reviews/_review", count: 2)
    end
    it "renders _tours partial for each tour suggest" do
      expect(view).to render_template(partial: "_tour", count: 2)
    end
  end

  before :each do
    assign :tour, tour
    assign :description_details, description_details
    assign :reviews, [review, review]
    assign :tours, [tour, tour]
    assign :rating, Rating.new
    assign :review, Review.new
  end

  context "non logged in user" do
    before {render}
    it_behaves_like "guest user"
  end

  context "logged in user" do
    before :each do
      sign_in user
      render
    end

    it_behaves_like "guest user"
    it "renders _rating form" do
      render
      expect(view).to render_template(partial: "ratings/_form")
    end
    it "renders _review form" do
      render
      expect(view).to render_template(partial: "reviews/_form")
    end
  end
end

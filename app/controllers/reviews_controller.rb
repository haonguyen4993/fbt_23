class ReviewsController < ApplicationController
  def create
    @review = Review.new review_params
    @review.save
    respond_to do |f|
      f.html{redirect_to tour_url params[:tour_id]}
      f.js
    end
  end

  private

  def review_params
    params.require(:review).permit :content, :tour_id, :user_id
  end
end

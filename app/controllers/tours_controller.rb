class ToursController < ApplicationController
  before_action :load_tour, only: :show

  def show
    store_location
    @description_details = @tour.description_details
    @reviews = @tour.reviews
    @tours = Tour.select_tours_by_category(@tour.category_id).except_id params[:id]
    able_to_review_and_rating
  end

  def index
    if params[:filter] == Settings.tour.param_newest
      @tours = Tour.paginate(page: params[:page], per_page: Settings.tour.per_page).newest_tour
    else
      @tours = Tour.paginate(page: params[:page], per_page: Settings.tour.per_page).search_by_tour_name(params[:search])
    end
  end

  private

  def load_tour
    @tour = Tour.find_by id: params[:id]
    return if @tour
    flash[:danger] = t ".error_noti"
    redirect_to root_url
  end

  def able_to_review_and_rating
    return unless logged_in?
    @review = Review.new
    @rating = @current_user.ratings.find_by tour_id: @tour.id
    @rating ||= Rating.new
  end
end

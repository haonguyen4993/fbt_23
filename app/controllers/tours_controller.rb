class ToursController < ApplicationController
  before_action :load_tour, only: :show

  def show
    @description_details = @tour.description_details.without_deleted.hidden_expired_detail
    @tours = Tour.without_deleted.select_tours_by_category(@tour.category_id)
      .except_id params[:id]
    able_to_review_and_rating
  end

  def index
    if params[:filter] == Settings.tour.param_newest
      @tours = Tour.without_deleted.newest_tour
        .paginate page: params[:page], per_page: Settings.tour.per_page
    else
      @tours = @search_tours.result
        .paginate(page: params[:page], per_page: Settings.tour.per_page)
    end
  end

  private

  def load_tour
    @tour = Tour.without_deleted.find_by id: params[:id]
    return if @tour
    flash[:danger] = t ".error_noti"
    redirect_to root_url
  end

  def able_to_review_and_rating
    return unless user_signed_in?
    @review = Review.new
    @rating = current_user.ratings.find_by tour_id: @tour.id
    @rating ||= Rating.new
  end
end

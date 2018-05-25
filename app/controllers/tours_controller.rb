class ToursController < ApplicationController
  before_action :load_tour, only: :show

  def show
    @description_details = @tour.description_details
    @reviews = @tour.reviews
    @tours = Tour.select_tour_by_category(@tour.category_id).except_id params[:id]
  end

  private

  def load_tour
    @tour = Tour.find_by id: params[:id]
    return if @tour
    flash[:danger] = t ".error_noti"
    redirect_to root_url
  end
end

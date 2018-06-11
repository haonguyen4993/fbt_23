class HistoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @bookings = Booking.accessible_by(current_ability).created_at_sort
      .paginate page: params[:page], per_page: Settings.booking.per_page
  end
end

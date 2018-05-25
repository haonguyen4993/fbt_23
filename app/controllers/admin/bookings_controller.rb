module Admin
  class BookingsController < BaseController
    def index
      @bookings = Booking.created_at_sort
        .paginate page: params[:page], per_page: Settings.booking.per_page
    end
  end
end

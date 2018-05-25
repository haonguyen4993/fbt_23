module Admin
  class DashboardController < BaseController
    def index
      @recent_bookings = Booking.created_at_sort.limit Settings.booking.limit
    end
  end
end

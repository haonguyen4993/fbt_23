class Admin::DashboardController < Admin::BaseController
  def index
    unless logged_in_as_admin?
      flash[:danger] = t "alert.permission_denied"
      redirect_to login_path
    end
    @recent_bookings = Booking.created_at_sort.limit Settings.booking.limit
  end
end

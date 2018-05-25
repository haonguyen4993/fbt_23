class BookingMailer < ApplicationMailer
  def booking_success user, booking
    @user = user
    @booking = booking

    mail to: user.email, subject: t("bookings.create.successed")
  end
end

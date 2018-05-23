class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:success] = t "alert.login_success", name: user.name
      redirect_back_or root_url
    else
      flash[:danger] = t "alert.invalid_login"
      render :new
    end
  end

  def destroy
    log_out
    flash[:success] = t "alert.logout_success"
    redirect_to root_url
  end
end

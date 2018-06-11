module Admin
  class BaseController < ApplicationController
    layout "admin/application"

    before_action :authenticate_admin

    private

    def authenticate_admin
      return if logged_in_as_admin?
      flash[:danger] = t "alert.permission_denied"
      redirect_to root_path
    end
  end
end

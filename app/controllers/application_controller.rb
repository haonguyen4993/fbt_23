class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :store_user_location!, if: :storable_location?
  before_action :load_categories

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: exception.message
  end

  def load_categories
    @super_categories = Category.available.super
  end

  def correct_user
    return if current_user? @user
    flash[:danger] = t "alert.permission_denied"
    redirect_to root_url
  end

  def storable_location?
    request.get?  && !devise_controller? && !request.xhr?
  end

  def store_user_location!
    store_location_for(:user, request.fullpath)
  end

  def after_sign_in_path_for(resource)
    resource.admin? ? admin_root_url : stored_location_for(resource)
  end
end

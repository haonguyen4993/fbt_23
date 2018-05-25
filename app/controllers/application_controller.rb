class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :load_categories

  def load_categories
    @super_categories = Category.super
  end
end

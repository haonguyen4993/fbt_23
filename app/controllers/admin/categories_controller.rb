module Admin
  class CategoriesController < BaseController
    before_action :load_category, only: %i(show destroy)

    def index
      @categories = Category.all
      @category = Category.new
    end

    def show
      @tours = @category.tours
    end

    def create
      @category = Category.new category_params
      @category.save
      respond_to :js
    end

    def destroy
      case
      when @category.childs.any?
        flash[:danger] = t "alert.has_subcategories"
      when Category.booking_by_id_and_status(@category.id, Booking.statuses[:pending]).any?
        flash[:danger] = t "alert.has_pending"
      when @category.tours.any?
        @category.destroy
        flash[:success] = t "alert.delete_category_success"
      else
        @category.really_destroy!
        flash[:success] = t "alert.delete_category_success"
      end
      redirect_to admin_categories_path
    end

    private

    def load_category
      @category = Category.find_by id: params[:id]
      return if @category
      flash[:danger] = t "alert.category_not_found"
      redirect_to admin_categories_path
    end

    def category_params
      params.require(:category).permit :name, :parent_id, :description
    end
  end
end

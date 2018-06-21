require "rails_helper"

describe Admin::ToursController do
  let(:tour) {create :tour}
  let(:category) {create :category}
  let(:admin_user) {create :admin}

  describe "admin access" do
    before {sign_in admin_user}

    it "checks admin user" do
      is_expected.to use_before_action :authenticate_admin
    end

    describe "GET #index" do
      before {get :index}
      it "populates an array of all tours" do
        tour_a = create :tour
        tour_b = create :tour
        expect(assigns :tours).to match_array [tour_a, tour_b]
      end
      it "renders the :index template" do
        is_expected.to render_template :index
      end
    end

    describe "GET #show" do
      context "found tour" do
        before {get :show, params: {id: tour}}
        it "assigns the request tour to @tour" do
          expect(assigns :tour).to eq tour
        end
        it "assigns the related description details to @description_details" do
          expect(assigns :description_details).to eq tour.description_details
        end
        it "renders the :show template" do
          is_expected.to render_template :show
        end
      end

      context "not found tour" do
        it "redirects to tour#index" do
          get :show, params: {id: Tour.all.count + 1}
          is_expected.to redirect_to admin_tours_path
        end
      end
    end

    describe "GET #new" do
      before {get :new}
      it "assigns a new Tour to @tour" do
        expect(assigns :tour).to be_a_new Tour
      end
      it "renders the :new template" do
        is_expected.to render_template :new
      end
    end

    describe "GET #edit" do
      context "found tour" do
        before {get :edit, params: {id: tour}}
        it "assigns the request tour to @tour" do
          expect(assigns :tour).to eq tour
        end
        it "renders the :edit template" do
          is_expected.to render_template :edit
        end
      end

      context "not found tour" do
        it "redirects to tour#index" do
          get :edit, params: {id: Tour.all.count + 1}
          is_expected.to redirect_to admin_tours_path
        end
      end
    end

    describe "POST #create" do
      context "with valid attributes" do
        it "saves the new tour to the database" do
          expect{
            post :create, params: {tour: attributes_for(:tour, category_id: category.id)}
          }.to change(Tour, :count).by 1
        end
        it "redirects to tour#index" do
          post :create, params: {tour: attributes_for(:tour, category_id: category.id)}
          is_expected.to redirect_to admin_tours_path
        end
      end
      context "with invalid attributes" do
        it "does not save the new tour to the database" do
          expect{
            post :create, params: {tour: attributes_for(:invalid_tour)}
          }.not_to change(Tour, :count)
        end
        it "re-renders the :new template" do
          post :create, params: {tour: attributes_for(:invalid_tour)}
          is_expected.to render_template :new
        end
      end
    end

    describe "PATCH #update" do
      context "with valid attributes" do
        before {patch :update, params: {id: tour, tour: attributes_for(:tour)}}
        it "locates the requested @tour" do
          expect(assigns :tour).to eq tour
        end
        it "shows update success message" do
          expect(flash[:success]).to eq I18n.t("admin.tours.update.tour_updated")
        end
        it "redirects to tour#show" do
          is_expected.to redirect_to admin_tour_path(tour)
        end
      end

      context "with invalid attributes" do
        it "re-renders the :edit template" do
          patch :update, params: {id: tour, tour: attributes_for(:invalid_tour)}
          is_expected.to render_template :edit
        end
      end
    end

    describe "DELETE #destroy" do
      context "can delete" do
        before {delete :destroy, params: {id: tour}}
        it "soft deletes the tour" do
          tour.reload
          expect(tour.deleted).to eq true
        end
        it "redirect to the tour#index" do
          is_expected.to redirect_to admin_tours_path
        end
      end

      context "can not delete" do
        let(:tour) {create :tour_has_pending_booking}
        before {delete :destroy, params: {id: tour}}
        it "shows danger message" do
          expect(flash[:danger]).to eq I18n.t("admin.tours.destroy.error_delete")
        end
        it "redirect to the tour#index" do
          is_expected.to redirect_to admin_tours_path
        end
      end
    end
  end
end

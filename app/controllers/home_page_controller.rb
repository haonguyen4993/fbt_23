class HomePageController < ApplicationController
  def home
    @tours = Tour.without_deleted.name_sort.limit Settings.tour.limit_list
    @newest_tours = Tour.without_deleted.newest_tour.limit Settings.tour.limit_list
    @recommended_tours = Tour.without_deleted.recommended_tour
      .limit Settings.tour.recommended_limit
  end
end

class HomeController < ApplicationController
  def index
    @restaurants = Restaurant.limit(10)
  end
end

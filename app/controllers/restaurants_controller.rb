class RestaurantsController < ApplicationController
  def new
    @restaurant = Restaurant.new
  end
end

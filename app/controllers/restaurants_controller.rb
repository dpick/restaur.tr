class RestaurantsController < ApplicationController
  def new
    @restaurant = Restaurant.new
  end

  def create
    u = Restaurant.create(:name => params[:name])
    puts u.save
    puts u
    redirect_to :action => "new"
  end
end

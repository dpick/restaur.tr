class RestaurantsController < ApplicationController
  def new
    @restaurant = Restaurant.new
  end

  def create
    res = Restaurant.create(params[:restaurant])
    redirect_to restaurant_path(res.name)
  end

  def destroy
    Restaurant.delete_all(:conditions => {:name => params[:id]})
    redirect_to restaurants_path
  end

  def update
   res = Restaurant.find_by_name(params[:id])
   res.update_attributes(:name => params[:new_name])
   redirect_to restaurant_path(res.name)
  end

  def show
    @restaurant = Restaurant.find_by_name(params[:id])
  end

  def index
    @restaurants = Restaurant.find(:all)
  end
end

require 'pp'

class RestaurantsController < ApplicationController
  def new
    @restaurant = Restaurant.new
  end

  def create
    params[:restaurant][:owner] = owner_from_id(params[:restaurant][:owner])
    res = Restaurant.create(params[:restaurant])
    redirect_to restaurant_path(res.name)
  end

  def destroy
    Restaurant.delete_all(:conditions => {:name => params[:id]})
    redirect_to restaurants_path
  end

  def update
    res = Restaurant.find(params[:id])
    res.update_attributes(params[:restaurant])
    redirect_to restaurant_path(res.name)
  end

  def show
    @restaurant = Restaurant.find_by_name(params[:id])
  end

  def index
    @restaurants = Restaurant.find(:all)
  end

  def owner_from_id(id)
    return nil if id.nil? or id.empty?
    User.find(params[:restaurant][:owner])
  end

  def menu
    @restaurant = Restaurant.find_by_name(params[:id])
  end
end

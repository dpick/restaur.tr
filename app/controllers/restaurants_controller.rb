require 'pp'

class RestaurantsController < ApplicationController
  def new
    @restaurant = Restaurant.new
  end

  def create
    params[:restaurant][:owner] = owner_from_id(params[:restaurant][:owner])

    res = Restaurant.create(:name => params[:restaurant][:name], :address => params[:restaurant][:address], :owner => params[:restaurant][:owner], :phone_number => params[:restaurant][:phone_number])
    section = res.sections.create(:name => params[:restaurant][:sections][:name])
    section.menuitems.create(params[:restaurant][:sections][:menuitems])

    redirect_to restaurant_path(res.name)
  end

  def owner_from_id(id)
    return nil if id.nil? or id.empty?
    User.find(params[:restaurant][:owner])
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
end

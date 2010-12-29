require 'spec_helper'
require 'devise/test_helpers'

describe RestaurantsController do
  render_views
  before do
    sign_in User.new
  end

  describe "create new restaurant site" do
    it "should have a name field" do
      get 'new'
      response.should have_selector("label", :content => "Name")
    end

    it "should create a new restaurant when submitted" do 
      post 'create', :name => "A New Restaurant"
      Restaurant.find(:all).count.should == 1
    end

    it "should show the new created restaurant after creation" do
      post 'create', :name => "A New Restaurant"
      get 'show', :id => "A New Restaurant"
      response.should have_selector("h1", :content => "A New Restaurant")
    end

    it "should automatically redirect to the show page after creating a restaurant" do
      post 'create', :name => "A New Restaurant"
      response.should redirect_to(restaurant_path("A New Restaurant"))
    end
  end

  describe "viewing an existing restaurant" do
    before do
      Restaurant.create(:name => "Akbar")
    end

    it "should be listed in the list of all restaurants" do
      get 'index'
      response.should have_selector("li", :content => "Akbar")
    end

    it "should be accessible through a direct name link" do
      get 'show', :id => "Akbar"
      response.should_not be_nil
    end

    it "should be accessible through a case insensitive name link" do
      get 'show', :id => "akbar"
      response.should_not be_nil
    end
  end

  describe "modifying an existing restaurant" do
    it "should delete a restaurant" do
      post 'create', :name => "test restaurant"
      delete :destroy, :id => "test restaurant"
      Restaurant.find(:all, :conditions => {:name => "test restaurant"}).empty?.should be_true
    end

    it "should update a restaurant name" do
      post 'create', :name => "test"
      post 'update', :id => "test", :new_name => "new test"
      Restaurant.find(:all, :conditions => {:name => "test"}).empty?.should be_true
      Restaurant.find(:all, :conditions => {:name => "new test"}).count.should == 1
    end
  end
end

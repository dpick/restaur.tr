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
  end
end

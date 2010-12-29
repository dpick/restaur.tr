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
  end
end

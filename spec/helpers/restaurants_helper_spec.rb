require 'spec_helper'
require 'mocha'

describe RestaurantsHelper do
  describe "when a user is logged in" do
    it "should give back a label and check box" do
      f = mock()
      f.expects(:label).returns("one - ")
      f.expects(:check_box).returns("two")
      helper.owner_area(f, User.new).should == "one - two"
    end
  end

  describe "when a user is not logged in" do
    it "should give a link to go log in" do
      helper.owner_area(nil, nil).should == "<a href=\"/users/sign_in\">Sign in to claim ownership</a>"
    end
  end
end

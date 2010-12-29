describe "UserModel" do
  it "can create a user model" do
    User.create(:name => "Test user", :email => "testuser@testuser.com", :password => "test123").should be_true
  end

  it "can persist the user model" do
    u = User.create(:name => "Test user2", :email => "testuser2@testuser.com", :password => "test123")
    User.find(:first, :conditions => {:name => "Test user2"}).should_not be_nil
  end
end

require "rails_helper"

RSpec.describe User, type: :model do

  before(:each) do
    @user = User.create!(first_name: "Summer", last_name: "Summer", email: "summer@email.com", password: "summer")
  end

  describe "validation" do
    it "should let a user be created with valid inputs" do
      expect(@user).to be_valid
    end

    it "should not let a user be created without email" do
      @user.email = nil
      expect(@user).to_not be_valid
    end

    it "should not let a user be created without password" do
      @user.password = nil
      expect(@user).to_not be_valid
    end
  end

    # it "should not let a user be created without first_name and last_name" do
    #   @user.first_name = nil
    #   @user.last_name = nil
    #   expect(@user).to_not be_valid
    # end

  describe "association" do
    it "should have many products" do
      User.reflect_on_association(:products).macro.should   eq(:has_many)
    end
  end

end
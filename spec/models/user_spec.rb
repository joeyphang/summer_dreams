require 'rails_helper'

RSpec.describe User, :type => :model do
	it{should have_many(:products)}
end

# describe User do
#   describe "Users" do
#     it "has_many products" do
#       assc = described_class.reflect_on_association(:products)
#       expect(assc.macro).to eq :has_many
#     end

#   describe "Validations" do
#     context "on a new user" do
#       it "should not be valid without a password" do
#         user = User.new password: nil, password_confirmation: nil
#         user.should_not be_valid
#       end
#   end
# end

# describe Validations do
#   describe "Validations" do
#     it "has_secure_password" do
#       assc = described_class.reflect_on_validation(:user)
#       expect(assc.macro).to eq :has_secure_password
#     end
#   end
# end

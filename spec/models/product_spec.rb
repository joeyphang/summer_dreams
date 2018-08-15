require "rails_helper"

RSpec.describe Product, type: :model do

	it "should belong to a user" do 
		product = Product.reflect_on_association(:user)
		expect(product.macro).to eq(:belongs_to)
	end

end


# RSpec.describe Product, type: :model do
#   it { should belong_to(:user) }
# end

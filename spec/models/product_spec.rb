# require 'rails_helper'

# RSpec.describe Product, type: :model do
#   it { should belong_to(:user) }
# end


describe Product do
  describe "Products" do
    it "belongs_to user" do
      assc = described_class.reflect_on_association(:user)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
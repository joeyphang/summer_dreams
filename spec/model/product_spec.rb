RSpec.describe Product, type: :model do
  it { should belong_to(:user) }
end
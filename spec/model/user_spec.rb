RSpec.describe User, type: :model do
  it { should have_many(:products) }
  it { should have_secure_password }
end
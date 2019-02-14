require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email) }
  end

  describe "Relations" do
    it { is_expected.to belong_to(:location) }
    it { is_expected.to belong_to(:position) }
    it { is_expected.to belong_to(:employer) }
    it { is_expected.to have_many(:connections).through(:messages) }
    it { is_expected.to have_many(:messages) }
  end

  it "exists" do
    user = create(:user)

    expect(user).to be_a User
  end
end

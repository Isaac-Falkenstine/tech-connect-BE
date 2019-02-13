require 'rails_helper'

RSpec.describe Location, type: :model do
  describe "Validations" do
    it { is_expected.to validate_presence_of(:city) }
  end

  describe "Relations" do
    it { is_expected.to have_many(:users) }
  end

  it "exists" do
    location = create(:location)

    expect(location).to be_a Location
  end
end

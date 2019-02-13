require 'rails_helper'

RSpec.describe Employer, type: :model do
  describe "Validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:site_url) }
  end

  describe "Relations" do
    it { is_expected.to have_many(:users) }
  end

  it "exists" do
    employer = create(:employer)

    expect(employer).to be_a Employer
  end
end

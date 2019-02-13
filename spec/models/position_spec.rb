require 'rails_helper'

RSpec.describe Position, type: :model do
  describe "Validations" do
    it { is_expected.to validate_presence_of(:job_title) }
  end

  describe "Relations" do
    it { is_expected.to have_many(:users) }
  end

  it "exists" do
    position = create(:position)

    expect(position).to be_a Position
  end
end

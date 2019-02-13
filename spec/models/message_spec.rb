require 'rails_helper'

RSpec.describe Message, type: :model do
  describe "Validations" do
    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to validate_presence_of(:meeting_date) }
    it { is_expected.to validate_presence_of(:meeting_location) }
  end

  describe "Relations" do
    it { is_expected.to belong_to(:user) }
    # belong to connection?
  end

  it "exists" do
    message = create(:message)

    expect(message).to be_a Message
  end
end

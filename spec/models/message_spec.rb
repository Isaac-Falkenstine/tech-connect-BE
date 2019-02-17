require 'rails_helper'

RSpec.describe Message, type: :model do
  describe "Validations" do
    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to validate_presence_of(:meeting_date) }
    it { is_expected.to validate_presence_of(:meeting_location) }
  end

  describe "Relations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:connection) }
  end

  it "exists" do
    message = create(:message)

    expect(message).to be_a Message
  end

  describe "Instace Methods" do
    it 'connected?' do
      user_1 = create(:user)
      user_2 = create(:user)
      user_3 = create(:user)
      create(:message, user_id: user_1.id, connection_id: user_2.id)

      users_connected = Message.connected?(user_1.id, user_2.id)
      users_not_connected = Message.connected?(user_1.id, user_3.id)

      expect(users_connected).to eq(true)
      expect(users_not_connected).to eq(false)
    end

    it 'find_by_user' do
      user_1 = create(:user)
      user_2 = create(:user)
      user_3 = create(:user)
      create(:message, user_id: user_1.id, connection_id: user_2.id)
      create(:message, user_id: user_3.id, connection_id: user_1.id)

      user_connections = Message.find_by_user(user_1)

      expect(user_connections.length).to eq(2)
      expect(user_connections[0]).to be_a(Message)
    end
  end
end

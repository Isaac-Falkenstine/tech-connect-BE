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

  describe "Instace Methods" do
    it 'make_key' do
      user = create(:user, api_key: nil)

      api_key = user.make_key

      expect(api_key).to be_a String
      expect(api_key.length).to eq(16)
    end

    it 'get_connections' do
      user_1 = create(:user)
      user_2 = create(:user)
      user_3 = create(:user)

      users = user_1.get_connections([user_2.id, user_3.id])

      expect(users.length).to eq(2)
      expect(users[0].id).to eq(user_2.id)
      expect(users[0].name).to eq(user_2.name)
      expect(users[0].email).to eq(user_2.email)
    end

    it 'get_name' do
      user_1 = create(:user)

      user_name = User.get_name(user_1.id)

      expect(user_name).to eq(user_1.name)
    end

    it 'get_suggestions' do
      location = create(:location)
      user_1 = create(:user, location_id: location.id)
      user_2 = create(:user, location_id: location.id)
      user_3 = create(:user, location_id: location.id)
      user_4 = create(:user, location_id: location.id)
      user_5 = create(:user, location_id: location.id)

      user_suggestions = user_1.get_suggestions(user_1)

      expect(user_suggestions.length).to eq(3)
      expect(user_suggestions[0]).to be_a(User)
    end

    it 'filter' do
      location = create(:location)
      employer = create(:employer)
      position = create(:position)

      user_1 = create(:user, location_id: location.id)
      user_2 = create(:user, location_id: location.id)
      user_3 = create(:user, employer_id: employer.id)
      user_4 = create(:user, employer_id: employer.id)
      user_5 = create(:user, position_id: position.id)
      user_6 = create(:user, position_id: position.id)
      user_7 = create(:user, name: "Isaac Falkenstine")
      user_8 = create(:user, name: "Isaac James")

      location_filtered_users = User.filter({"city": location.city})
      employer_filtered_users = User.filter({"employer": employer.name})
      position_filtered_users = User.filter({"position": position.job_title})
      name_filtered_users = User.filter({"name": "Isaac"})

      expect(location_filtered_users.length).to eq(2)
      expect(location_filtered_users[0]).to be_a(User)
      expect(employer_filtered_users.length).to eq(2)
      expect(employer_filtered_users[0]).to be_a(User)
      expect(position_filtered_users.length).to eq(2)
      expect(position_filtered_users[0]).to be_a(User)
      expect(name_filtered_users.length).to eq(2)
      expect(name_filtered_users[0]).to be_a(User)
    end
  end
end

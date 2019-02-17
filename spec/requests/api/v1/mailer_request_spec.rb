require "rails_helper"

describe "Mailers Request" do

  it 'can send an email with meeting request info' do
    user = create(:user, name: "Bailey")
    user_2 = create(:user, name: "Isaac")
    params = {
      "api_key": "#{user.id}",
      "connection_id": "#{user_2.id}",
      "datetime_1": "#{DateTime.new(2002,2,6,9,5,1)}",
      "datetime_1": "#{DateTime.new(2003,2,6,9,5,1)}",
      "datetime_1": "#{DateTime.new(2004,2,6,9,5,1)}",
      "meeting_1": "Starbucks on Broadway",
      "meeting_1": "Dazbog on 17th",
      "meeting_1": "Coffehouse on Champa"
    }

    post "api/v1/mailers", params: params
  end
end

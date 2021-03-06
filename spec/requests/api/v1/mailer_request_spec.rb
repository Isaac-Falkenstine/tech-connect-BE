require "rails_helper"

describe "Mailers Request" do

  it 'can send an email with meeting request info' do
    user = create(:user, name: "Bailey", email: "bailey@email.com")
    user_2 = create(:user, name: "Isaac", email: "isaac@email.com")
    params = {
      "api_key": "#{user.api_key}",
      "connection_id": "#{user_2.id}",
      "datetime_1": "#{DateTime.new(2002,2,6,9,5,1)}",
      "datetime_2": "#{DateTime.new(2003,2,6,9,5,1)}",
      "datetime_3": "#{DateTime.new(2004,2,6,9,5,1)}",
      "meeting_1": "Starbucks on Broadway",
      "meeting_2": "Dazbog on 17th",
      "meeting_3": "Coffehouse on Champa"
    }

    post "/api/v1/mailers", params: params

    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:success]).to eq("Email Sent")
  end

  it 'cannot send an email withou api_key' do
    user = create(:user, name: "Bailey", email: "bailey@email.com")
    user_2 = create(:user, name: "Isaac", email: "isaac@email.com")
    params = {
      "connection_id": "#{user_2.id}",
      "datetime_1": "#{DateTime.new(2002,2,6,9,5,1)}",
      "datetime_2": "#{DateTime.new(2003,2,6,9,5,1)}",
      "datetime_3": "#{DateTime.new(2004,2,6,9,5,1)}",
      "meeting_1": "Starbucks on Broadway",
      "meeting_2": "Dazbog on 17th",
      "meeting_3": "Coffehouse on Champa"
    }

    post "/api/v1/mailers", params: params

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(response).not_to be_successful

    expect(parsed[:error]).to eq("Unauthorized")
  end
end

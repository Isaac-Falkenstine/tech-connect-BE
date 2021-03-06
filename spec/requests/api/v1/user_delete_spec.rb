require 'rails_helper'

describe 'deleting a user request and response' do

  it 'DELETE /api/v1/users/:id with api_key' do
    user_1 = create(:user, name: "Isaac Falkenstine")
    user_2 = create(:user, name: "Bailey Diveley")
    user_3 = create(:user, name: "Kylie Stanley")

    message = create(:message, user_id: user_1.id, connection_id: user_2.id)
    message = create(:message, user_id: user_1.id, connection_id: user_3.id)

    params = {api_key: user_1.api_key}

    delete "/api/v1/users/#{user_1.id}", params: params

    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(User.all.length).to eq(2)
    expect(Message.all.length).to eq(0)
    expect(parsed[:message]).to eq("Isaac Falkenstine has been deleted")
  end

  it 'DELETE /api/v1/users/:id without api_key' do
    user_1 = create(:user, name: "Isaac Falkenstine")

    delete "/api/v1/users/#{user_1.id}"

    expect(response).not_to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:error]).to eq("Unauthorized")
  end
end

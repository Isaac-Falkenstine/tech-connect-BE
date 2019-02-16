require 'rails_helper'

describe 'deleting a user request and response' do

  it 'DELETE /api/v1/users/:id with api_key' do
    user_1 = create(:user, name: "Isaac Falkenstine")

    params = {api_key: user_1.api_key}

    delete "/api/v1/users/#{user_1.id}", params: params

    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(User.all.length).to eq(0)
    expect(parsed[:message]).to eq("Isaac Falkenstine has been deleted")
  end
end

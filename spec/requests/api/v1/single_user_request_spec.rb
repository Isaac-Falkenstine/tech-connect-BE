require 'rails_helper'

describe 'making a position api and response' do

  it 'GET /api/v1/users/id with api key' do
    user_1 = create(:user, name: "Isaac Falkenstine")
    create(:user, name: "Bailey Diveley")

    params = {api_key: user_1.api_key}

    get "/api/v1/users/#{user_1.id}", params: params

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:data][:attributes]).to have_key(:name)
    expect(parsed[:data][:attributes]).to have_key(:phone_number)
    expect(parsed[:data][:attributes]).to have_key(:email)

    expect(parsed[:data][:attributes][:name]).to eq("Isaac Falkenstine")
  end

  it 'GET /api/v1/users/id without api_key' do
    user_1 = create(:user, name: "Isaac Falkenstine")
    create(:user, name: "Bailey Diveley")

    get "/api/v1/users/#{user_1.id}"

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:data][:attributes]).to have_key(:name)
    expect(parsed[:data][:attributes]).not_to have_key(:phone_number)
    expect(parsed[:data][:attributes]).not_to have_key(:email)

    expect(parsed[:data][:attributes][:name]).to eq("Isaac Falkenstine")
  end
end

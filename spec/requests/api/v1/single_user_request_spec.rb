require 'rails_helper'

describe 'getting a user request and response' do

  it 'GET /api/v1/users/id without connection' do
    user_1 = create(:user, name: "Isaac Falkenstine")
    user_2 = create(:user, name: "Bailey Diveley")

    params = {api_key: user_1.api_key}

    get "/api/v1/users/#{user_2.id}", params: params

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:data][:attributes]).to have_key(:name)
    expect(parsed[:data][:attributes]).to have_key(:linkedin)
    expect(parsed[:data][:attributes]).to have_key(:employer)

    expect(parsed[:data][:attributes]).not_to have_key(:phone_number)
    expect(parsed[:data][:attributes]).not_to have_key(:email)
    expect(parsed[:data][:attributes]).not_to have_key(:api_key)

    expect(parsed[:data][:attributes][:name]).to eq("Bailey Diveley")
  end

  it 'GET /api/v1/users/id with connection' do
    user_1 = create(:user, name: "Isaac Falkenstine")
    user_2 = create(:user, name: "Bailey Diveley")
    message = create(:message, user_id: user_1.id, connection_id: user_2.id)
    params = {api_key: user_1.api_key}

    get "/api/v1/users/#{user_2.id}", params: params

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:data][:attributes]).to have_key(:name)
    expect(parsed[:data][:attributes]).to have_key(:linkedin)
    expect(parsed[:data][:attributes]).to have_key(:employer)

    expect(parsed[:data][:attributes]).to have_key(:phone_number)
    expect(parsed[:data][:attributes]).to have_key(:email)

    expect(parsed[:data][:attributes][:name]).to eq("Bailey Diveley")
  end

  it 'GET /api/v1/users/id with no api_key' do
    user_1 = create(:user, name: "Isaac Falkenstine")
    user_2 = create(:user, name: "Bailey Diveley")

    get "/api/v1/users/#{user_2.id}"

    expect(response).not_to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:error]).to eq("Unauthorized")
  end
end

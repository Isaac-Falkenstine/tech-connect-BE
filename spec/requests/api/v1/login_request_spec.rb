require 'rails_helper'

describe 'user login request and response' do

  it 'POST /api/v1/login' do
    user = create_list(:user, 1, password: "password")
    message = create_list(:message, 1, user_id: user.first.id)
    params = {email: user.first.email, password: user.first.password}
    post '/api/v1/login',  params: params

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:data][:attributes]).to have_key(:api_key)
    expect(parsed[:data][:attributes][:api_key]).to eq(user.first.api_key)
    expect(parsed[:data][:attributes]).to have_key(:email)
    expect(parsed[:data][:attributes][:email]).to eq(user.first.email)
    expect(parsed[:data][:attributes]).to have_key(:name)
    expect(parsed[:data][:attributes]).to have_key(:github)
    expect(parsed[:data][:attributes]).to have_key(:linkedin)
    expect(parsed[:data][:attributes]).to have_key(:bio)
    expect(parsed[:data][:attributes]).to have_key(:phone_number)
    expect(parsed[:data][:attributes]).to have_key(:location)
    expect(parsed[:data][:attributes]).to have_key(:position)
    expect(parsed[:data][:attributes]).to have_key(:employer)
    expect(parsed[:data][:attributes]).to have_key(:connections)
    expect(parsed[:data][:attributes][:connections].length).to eq(1)

  end
  it 'POST /api/v1/login is unsuccessful if user input is invalid' do
    params = {email: "fake@email.com", password: "password"}
    post '/api/v1/login',  params: params

    expect(response).not_to be_successful
    expect(response.body).to eq("Unauthorized")
  end
end

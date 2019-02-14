require 'rails_helper'

describe 'user login request and response' do

  it 'POST /api/v1/login' do
    user = create(:user, password: "password")
    params = {email: user.email, password: user.password}
    post '/api/v1/login',  params: params

    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:data][:attributes]).to have_key(:api_key)
    expect(parsed[:data][:attributes]).to have_key(:email)
    expect(parsed[:data][:attributes]).to have_key(:name)
    expect(parsed[:data][:attributes]).to have_key(:github)
    expect(parsed[:data][:attributes]).to have_key(:linkedin)
    expect(parsed[:data][:attributes]).to have_key(:bio)
    expect(parsed[:data][:attributes]).to have_key(:phone_number)
    expect(parsed[:data][:attributes]).to have_key(:location)
    expect(parsed[:data][:attributes]).to have_key(:position)
    expect(parsed[:data][:attributes]).to have_key(:employer)

  end
end

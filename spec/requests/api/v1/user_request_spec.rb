require 'rails_helper'

describe 'making a user api and response' do

  it 'POST /api/v1/users' do
    post '/api/v1/users?email=email_address@example.com&password=password&password_confirmation=password'

    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:data][:attributes][:api_key]).to eq(User.last[:api_key])
    expect(User.last.email).to eq('email_address@example.com')
  end

  it 'POST /api/v1/users duplicate' do
    post '/api/v1/users?email=email_address@example.com&password=password&password_confirmation=password'
    post '/api/v1/users?email=email_address@example.com&password=password&password_confirmation=password'
    expect(response).not_to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:error]).to eq("It looks like a user is already using that email! Please try again.")
  end
end

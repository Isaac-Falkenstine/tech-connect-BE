require 'rails_helper'

describe 'making a user api and response' do

  it 'POST /api/v1/users' do
    params = {email: "email_address@example.com", password: "password", password_confirmation: "password"}
    post '/api/v1/users',  params: params

    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:data][:attributes][:api_key]).to eq(User.last[:api_key])
    expect(User.last.email).to eq('email_address@example.com')
  end

  it 'POST /api/v1/users duplicate' do
    params = {email: "email_address@example.com", password: "password", password_confirmation: "password"}
    post '/api/v1/users',  params: params
    post '/api/v1/users',  params: params

    expect(response).not_to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:error]).to eq("That e-mail already exists.")
  end

  it 'POST /api/v1/users no password confirmation' do
    params = {email: "email_address@example.com", password: "password", password_confirmation: "ppaasssswwoorrdd"}
    post '/api/v1/users',  params: params

    expect(response).not_to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:error]).to eq("The passwords don't match")
  end
end

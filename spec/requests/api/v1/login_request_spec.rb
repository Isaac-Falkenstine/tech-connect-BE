require 'rails_helper'

describe 'user login request and response' do

  it 'POST /api/v1/login' do
    location_1 = create(:location)
    user = create_list(:user, 1, password: "password", location_id: location_1.id, name: "Bailey")
    user_2 = create(:user, name: "Isaac", location_id: location_1.id)
    user_3 = create(:user, name: "Gonzo", location_id: location_1.id)
    user_4 = create(:user, name: "Kaylee", location_id: location_1.id)
    user_5 = create(:user, name: "Kylie", location_id: location_1.id)
    user_6 = create(:user)

    message_2 = create(:message, user_id: user_2.id, connection_id: user.first.id)
    message_3 = create(:message, user_id: user.first.id, connection_id: user_3.id)
    message_4 = create(:message, user_id: user_2.id, connection_id: user_3.id)
    params = {email: user.first.email, password: user.first.password}
    post '/api/v1/login',  params: params

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:data][:attributes]).to have_key(:api_key)
    expect(parsed[:data][:attributes][:api_key]).to eq(user.first.api_key)
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
    expect(parsed[:data][:attributes][:connections][0]).to have_key(:id)
    expect(parsed[:data][:attributes][:connections][0]).to have_key(:name)
    expect(parsed[:data][:attributes][:connections][0]).to have_key(:city)
    expect(parsed[:data][:attributes][:connections][0]).to have_key(:company)
    expect(parsed[:data][:attributes][:connections][0]).to have_key(:job_title)

    expect(parsed[:data][:attributes][:suggestions].length).to eq(3)

  end
  it 'POST /api/v1/login is unsuccessful if user input is invalid' do
    params = {email: "fake@email.com", password: "password"}
    post '/api/v1/login',  params: params

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(response).not_to be_successful

    expect(parsed[:error]).to eq("Unauthorized.")
  end

end

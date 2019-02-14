require 'rails_helper'

describe 'making a user api and response' do

  it 'PATCH /api/v1/users with api_key in body' do
    user = create(:user, api_key: "123")
    params = {api_key: "#{user.api_key}",
              name: "Joe Shmoe",
              email: "email@gmail.com",
              bio: "Hey guys!",
              github: "github.com/user/joe",
              linkedin: "linkedin.com/user/joe",
              phone_number: 7204908123,
              location: "Denver,CO",
              employer: "Turing School for Software & Desgin",
              position: "Backend Instructor"}

    patch '/api/v1/users',  params: params

    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(user.email).to eq('email@gmail.com')
    expect(user.bio).to eq('Hey guys!')
    expect(user.phone_number).to eq(7204908123)
    expect(user.github).to eq("github.com/user/joe")

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
    expect(parsed[:data][:attributes][:connections].length).to eq(0)
  end
end

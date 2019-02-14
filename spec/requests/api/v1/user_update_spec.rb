require 'rails_helper'

describe 'making a user api and response' do

  it 'PATCH /api/v1/users with api_key in body' do
    user_1 = create(:user, api_key: "123", github: nil)
    location = create(:location, city: "Denver,CO")
    position = create(:position, job_title: "Backend Instructor")
    employer = create(:employer, name: "Turing School for Software & Desgin")

    params = {api_key: "#{user_1.api_key}",
              name: "Joe Shmoe",
              email: "email@gmail.com",
              bio: "Hey guys!",
              linkedin: "linkedin.com/user/joe",
              phone_number: 7204908123,
              location: "Denver,CO",
              employer: "Turing School for Software & Desgin",
              position: "Backend Instructor"}

    patch '/api/v1/users',  params: params

    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)
    user = User.find_by(api_key: parsed[:data][:attributes][:api_key])

    expect(user.email).to eq('email@gmail.com')
    expect(user.bio).to eq('Hey guys!')
    expect(user.phone_number).to eq(7204908123)
    expect(user.github).to eq(nil)

    expect(parsed[:data][:attributes]).to have_key(:api_key)
    expect(parsed[:data][:attributes][:api_key]).to eq(user.api_key)
    expect(parsed[:data][:attributes]).to have_key(:email)
    expect(parsed[:data][:attributes][:email]).to eq(user.email)
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

  it 'PATCH /api/v1/users no api_key' do
    user_1 = create(:user, api_key: "123")
    location = create(:location, city: "Denver,CO")
    position = create(:position, job_title: "Backend Instructor")
    employer = create(:employer, name: "Turing School for Software & Desgin")

    params = {name: "Joe Shmoe",
              email: "email@gmail.com",
              bio: "Hey guys!",
              github: "github.com/user/joe",
              linkedin: "linkedin.com/user/joe",
              phone_number: 7204908123,
              location: "Denver,CO",
              employer: "Turing School for Software & Desgin",
              position: "Backend Instructor"}

    patch '/api/v1/users',  params: params


    expect(response).not_to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:error]).to eq("Unauthorized")
  end
end

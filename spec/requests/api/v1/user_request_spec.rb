require 'rails_helper'

describe 'making a position api and response' do

  it 'GET /api/v1/users' do
    user_1 = create(:user, name: "Isaac Falkenstine")
    create(:user, name: "Bailey Diveley")
    create(:user, name: "Kaylee Bunce")
    create(:user, name: "Kylie Stanley")

    params = {api_key: user_1.api_key}

    get '/api/v1/users', params: params

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:data]).to be_a(Array)
    expect(parsed[:data].length).to eq(4)
    expect(parsed[:data][0][:attributes]).to have_key(:name)
  end

  it 'GET /api/v1/users without api_key' do
    create(:user, name: "Isaac Falkenstine")
    create(:user, name: "Bailey Diveley")
    create(:user, name: "Kaylee Bunce")
    create(:user, name: "Kylie Stanley")

    get '/api/v1/users'

    expect(response).not_to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:error]).to eq("Unauthorized")
  end
  it 'GET /api/v1/users/find?name=Bailey-D' do
    user_1 = create(:user, name: "Isaac Falkenstine")
    create(:user, name: "Bailey Diveley")
    create(:user, name: "Kaylee Bunce")
    create(:user, name: "Kylie Stanley")

    params = {api_key: user_1.api_key}

    get '/api/v1/users/find?name=Bailey-D', params: params

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:data]).to be_a(Array)
    expect(parsed[:data].length).to eq(1)
    expect(parsed[:data][0][:attributes]).to have_key(:name)
    expect(parsed[:data][0][:attributes][:name]).to eq("Bailey Diveley")
  end
  it 'GET /api/v1/users/find?name=bailey case insensitive' do
    user_1 = create(:user, name: "Isaac Falkenstine")
    create(:user, name: "Bailey Diveley")
    create(:user, name: "Kaylee Bailey")
    create(:user, name: "Kylie Stanley")

    params = {api_key: user_1.api_key}

    get '/api/v1/users/find?name=bailey', params: params

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:data]).to be_a(Array)
    expect(parsed[:data].length).to eq(2)
    expect(parsed[:data][0][:attributes]).to have_key(:name)
    expect(parsed[:data][0][:attributes][:name]).to eq("Bailey Diveley")
  end
  it 'GET /api/v1/users/find without api_key' do
    create(:user, name: "Isaac Falkenstine")
    create(:user, name: "Bailey Diveley")
    create(:user, name: "Kaylee Bunce")
    create(:user, name: "Kylie Stanley")

    get '/api/v1/users/find?name=Bailey'

    expect(response).not_to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:error]).to eq("Unauthorized")
  end
  it 'GET /api/v1/users/find?city=san-francisco' do
    location_1 = create(:location, city: "San Francisco")
    user_1 = create(:user, name: "Isaac Falkenstine", location_id: location_1.id)
    user_2 = create(:user, name: "Bailey Diveley", location_id: location_1.id)
    location_2 = create(:location, city: "Boulder")
    user_3 = create(:user, name: "Madonna", location_id: location_2.id)

    params = {api_key: user_1.api_key}

    get '/api/v1/users/find?city=san-francisco', params: params

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed[:data]).to be_a(Array)
    expect(parsed[:data].length).to eq(2)
    expect(parsed[:data][0][:attributes]).to have_key(:name)
    expect(parsed[:data][0][:attributes][:name]).to eq(user_1.name)
  end
  it 'GET /api/v1/users/find?employer=turing-school' do
    employer_1 = create(:employer, name: "Turing School")
    employer_2 = create(:employer, name: "Google")
    user_1 = create(:user, name: "Isaac Falkenstine", employer_id: employer_2.id)
    user_2 = create(:user, name: "Bailey Diveley", employer_id: employer_1.id)
    user_3 = create(:user, name: "Madonna", employer_id: employer_1.id)

    params = {api_key: user_1.api_key}

    get '/api/v1/users/find?employer=turing-school', params: params

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:data]).to be_a(Array)
    expect(parsed[:data].length).to eq(2)
    expect(parsed[:data][0][:attributes]).to have_key(:name)
    expect(parsed[:data][0][:attributes][:name]).to eq(user_2.name)
  end
  it 'GET /api/v1/users/find?position=junior-engineer' do
    position_1 = create(:position, job_title: "Junior Engineer")
    position_2 = create(:position, job_title: "Mobile Engineer")
    user_1 = create(:user, name: "Isaac Falkenstine", position_id: position_2.id)
    user_2 = create(:user, name: "Bailey Diveley", position_id: position_1.id)
    user_3 = create(:user, name: "Madonna", position_id: position_1.id)

    params = {api_key: user_1.api_key}

    get '/api/v1/users/find?position=junior-engineer', params: params

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:data]).to be_a(Array)
    expect(parsed[:data].length).to eq(2)
    expect(parsed[:data][0][:attributes]).to have_key(:name)
  end
end

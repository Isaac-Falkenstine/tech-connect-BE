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
    expect(parsed[:data][0][:attributes][:name]).to eq("Isaac Falkenstine")
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
  it 'GET /api/v1/users/find?name=Bailey' do
    user_1 = create(:user, name: "Isaac Falkenstine")
    create(:user, name: "Bailey Diveley")
    create(:user, name: "Kaylee Bunce")
    create(:user, name: "Kylie Stanley")

    params = {api_key: user_1.api_key}

    get '/api/v1/users/find?name=Bailey', params: params

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:data]).to be_a(Array)
    expect(parsed[:data].length).to eq(1)
    expect(parsed[:data][0][:attributes]).to have_key(:name)
    expect(parsed[:data][0][:attributes][:name]).to eq("Bailey Diveley")
  end
  it 'GET /api/v1/users/find?name=bailey' do
    user_1 = create(:user, name: "Isaac Falkenstine")
    create(:user, name: "Bailey Diveley")
    create(:user, name: "Kaylee Bunce")
    create(:user, name: "Kylie Stanley")

    params = {api_key: user_1.api_key}

    get '/api/v1/users/find?name=bailey', params: params

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:data]).to be_a(Array)
    expect(parsed[:data].length).to eq(1)
    expect(parsed[:data][0][:attributes]).to have_key(:name)
    expect(parsed[:data][0][:attributes][:name]).to eq("Bailey Diveley")
  end
end

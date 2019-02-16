require 'rails_helper'

describe 'making a position api and response' do

  it 'GET /api/v1/users' do
    user_1 = create(:user, name: "Isaac Falkenstine")
    create(:user, name: "Bailey Diveley")

    params = {api_key: user_1.api_key}

    get '/api/v1/users', params: params

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:data]).to be_a(Array)
    expect(parsed[:data].length).to eq(1)
    expect(parsed[:data][0][:attributes]).to have_key(:name)
    expect(parsed[:data][0][:attributes][:name]).to eq("Isaac Falkenstine")
  end
end

require 'rails_helper'

describe 'making a position api and response' do

  it 'GET /api/v1/users' do
    create(:user, name: "Isaac Falkenstine")
    create(:user, name: "Bailey Diveley")
    create(:user, name: "Kaylee Bunce")
    create(:user, name: "Kylie Stanley")

    get '/api/v1/users'

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:data]).to be_a(Array)
    expect(parsed[:data].length).to eq(4)
    expect(parsed[:data][0][:attributes]).to have_key(:name)
    expect(parsed[:data][0][:attributes][:name]).to eq("Isaac Falkenstine")
  end
end

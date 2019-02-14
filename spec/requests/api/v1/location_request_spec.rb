require 'rails_helper'

describe 'making a location api and response' do

  it 'GET /api/v1/locations' do
    location = create(:location, city: "Denver,CO")
    location = create(:location, city: "Boulder,CO")
    location = create(:location, city: "Ft Collins,CO")
    location = create(:location, city: "Golden,CO")

    get '/api/v1/locations'

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed[:data]).to be_a(Array)
    expect(parsed[:data].length).to eq(4)
    expect(parsed[:data][0][:attributes]).to have_key(:city)
    expect(parsed[:data][0][:attributes][:city]).to eq("Denver,CO")
  end
end

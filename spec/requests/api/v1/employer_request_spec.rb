require 'rails_helper'

describe 'making an employer api and response' do

  it 'GET /api/v1/employers' do
    employer = Employer.create(name: "Google", site_url: "google.com")
    employer = create(:employer)
    employer = create(:employer)
    employer = create(:employer)

    get '/api/v1/employers'

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed[:data]).to be_a(Array)
    expect(parsed[:data].length).to eq(4)
    expect(parsed[:data][0][:attributes]).to have_key(:name)
    expect(parsed[:data][0][:attributes]).to have_key(:site_url)
    expect(parsed[:data][0][:attributes][:name]).to eq("Google")
    expect(parsed[:data][0][:attributes][:site_url]).to eq("google.com")
  end
end

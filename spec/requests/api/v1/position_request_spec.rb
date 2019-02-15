require 'rails_helper'

describe 'making a position api and response' do

  it 'GET /api/v1/positions' do
    position = create(:position, job_title: "Jr Engineer")
    position = create(:position, job_title: "Sr Engineer")
    position = create(:position, job_title: "DevOps Engineer")
    position = create(:position, job_title: "Mobile Engineer")

    get '/api/v1/positions'

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed[:data]).to be_a(Array)
    expect(parsed[:data].length).to eq(4)
    expect(parsed[:data][0][:attributes]).to have_key(:job_title)
    expect(parsed[:data][0][:attributes][:job_title]).to eq("Jr Engineer")
  end
end

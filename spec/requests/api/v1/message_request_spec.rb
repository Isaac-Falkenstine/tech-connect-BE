require "rails_helper"

describe 'making a message api and response' do

  it 'GET /api/v1/messages' do
    user = create(:user)
    create(:message, user_id: user.id)
    create(:message, connection_id: user.id)
    create(:message, user_id: user.id)
    create(:message)
    params = {api_key: user.api_key}

    get '/api/v1/messages', params: params

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed[:data]).to be_a(Array)
    expect(parsed[:data].length).to eq(3)
    expect(parsed[:data][0][:attributes]).to have_key(:status)
    expect(parsed[:data][0][:attributes]).to have_key(:meeting_date)
    expect(parsed[:data][0][:attributes]).to have_key(:meeting_location)
    #should also return connection_id's name
    expect(parsed[:data][0][:attributes]).to have_key(:connection_id)
  end
end

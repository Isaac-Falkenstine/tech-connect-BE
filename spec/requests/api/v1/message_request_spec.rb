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

    expect(parsed[:data][0][:attributes]).to have_key(:sender)
    expect(parsed[:data][0][:attributes]).to have_key(:receiver)
  end
  it 'GET /api/v1/messages without api_key' do

    get '/api/v1/messages'

    expect(response).not_to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:error]).to eq("Unauthorized")
  end
  it 'POST users/:id/messages?email=email&status=confirmed' do
    user_1 = create(:user, email: "sending@gmail.com")
    user_2 = create(:user, email: "test@gmail.com")
    params = {"meeting_location"=>"Starbucks on Broadway", "meeting_date"=>"02-07-2019 06:17", "make-meeting"=>""
    }
    expect(Message.where(user_id: user_1.id).length).to eq(0)

    post "/api/v1/users/#{user_1.id}/messages?email=#{user_2.email}&status=confirmed", params: params

    expect(Message.where(user_id: user_1.id).length).to eq(1)
    expect(Message.where(user_id: user_1.id).last.status).to eq("confirmed")
  end

  it 'POST users/:id/messages?email=email&status=declined' do
    user_1 = create(:user, email: "sending@gmail.com")
    user_2 = create(:user, email: "test@gmail.com")
    params = {"meeting_location"=>"Starbucks on Broadway", "meeting_date"=>"02-07-2019 06:17", "rainc-heck"=>""
    }
    expect(Message.where(user_id: user_1.id).length).to eq(0)

    post "/api/v1/users/#{user_1.id}/messages?email=#{user_2.email}&status=declined", params: params

    expect(Message.where(user_id: user_1.id).length).to eq(1)
    expect(Message.where(user_id: user_1.id).last.status).to eq("declined")
  end
end

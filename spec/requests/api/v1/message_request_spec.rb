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
  it 'GET users/:id/messages/new' do
    user_1 = create(:user, email: "sending@gmail.com")
    user_2 = create(:user, email: "test@gmail.com")
    params = {"meeting_location"=>"Starbucks on Broadway", "meeting_date"=>"02-07-2019 06:17", "#{user_2.email}-confirmed"=>""
    }
    expect(Message.where(user_id: user_1.id).length).to eq(0)

    get "/api/v1/users/#{user_1.id}/messages/new", params: params

    expect(Message.where(user_id: user_1.id).length).to eq(1)
    expect(Message.where(user_id: user_1.id).last.status).to eq("confirmed")
  end

  it 'GET users/:id/messages/new' do
    user_1 = create(:user, email: "sending@gmail.com")
    user_2 = create(:user, email: "test@gmail.com")
    params = {"meeting_location"=>"Starbucks on Broadway", "meeting_date"=>"02-07-2019 06:17", "#{user_2.email}-declined" => ""
    }
    expect(Message.where(user_id: user_1.id).length).to eq(0)

    get "/api/v1/users/#{user_1.id}/messages/new", params: params

    expect(Message.where(user_id: user_1.id).length).to eq(1)
    expect(Message.where(user_id: user_1.id).last.status).to eq("declined")
  end
  it 'GET users/:id/messages/new' do
    user_1 = create(:user, email: "sending@gmail.com")
    user_2 = create(:user, email: "test@gmail.com")
    message = create(:message, user: user_1, connection: user_2)
    params = {"meeting_location"=>"Starbucks on Broadway", "meeting_date"=>"02-07-2019 06:17", "#{user_2.email}-confirmed" => "", "token" => "abc123"}
    expect(Message.where(user_id: user_1.id).length).to eq(1)

    get "/api/v1/users/#{user_1.id}/messages/new", params: params

    expect(Message.where(user_id: user_1.id).length).to eq(1)
  end
end

class Api::V1::MessagesController < ApplicationController

  def index
    if current_user
      messages = Message.find_by_user(current_user)
      render json: MessageSerializer.new(messages)
    else
      render :json => {error: "Unauthorized"}, status: 403
    end
  end

  def create
    if params[:status] == "confirmed"
      Message.create(message_params)
    end
  end

private
  def message_params
    update_info = params.permit(:meeting_location, :meeting_date, :status, :user_id)
    id = User.where(email: params[:email])[0].id
    update_info[:connection_id] =id
    return update_info
  end
end

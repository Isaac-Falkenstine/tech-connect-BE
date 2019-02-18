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
    message = Message.create(message_params
    if message.status == "confirmed"
      ConfirmationMailer.confirm(message_params).deliver_now
    else
      ConfirmationMailer.decline(message_params).deliver_now
    end 
  end

private
  def message_params
    if params.has_key?("make-meeting")
      update_info = params.permit(:meeting_location, :meeting_date, :user_id)
      id = User.where(email: params[:email])[0].id
      update_info[:connection_id] =id
      return update_info
    else
      update_info = params.permit(:user_id)
      id = User.where(email: params[:email])[0].id
      update_info[:connection_id] =id
      update_info[:status] = "declined"
      update_info[:meeting_location] = "N/A"
      update_info[:meeting_date] = DateTime.new(0000,1,1,1,1,1)

      return update_info
    end
  end
end

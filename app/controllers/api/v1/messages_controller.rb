class Api::V1::MessagesController < ApplicationController

  def index
    if current_user
      messages = Message.find_by_user(current_user)
      render json: MessageSerializer.new(messages)
    else
      render :json => {error: "Unauthorized"}, status: 403
    end
  end

  def new
    message = Message.create(message_params)
    if message.status == "confirmed"
      ConfirmationMailer.confirm(message_params).deliver_now
    else
      ConfirmationMailer.decline(message_params).deliver_now
    end
  end

private
  def message_params
    id = User.where(email: find_email(params.keys)).first.id
    if params.keys.any? { |k| k.include?("confirmed") }
      update_info = params.permit(:meeting_location, :meeting_date, :user_id, :status)
      update_info[:status] = "confirmed"
      update_info[:connection_id] = id
      update_info[:meeting_date] = format_date(params[:meeting_date])
    else
      update_info = params.permit(:user_id)
      update_info[:connection_id] = id
      update_info[:status] = "declined"
      update_info[:meeting_location] = "N/A"
      update_info[:meeting_date] = DateTime.new(0000,1,1,1,1,1)
    end
    return update_info
  end

  def find_email(keys)
    key = keys.find do |key|
      key.include?('@')
    end
    return key.split('-').first
  end

  def format_date(string)
    array = string.split(" ")
    element = array.first.split("-")
    first_element = element.rotate(-1)
    first_element.join("-") + " #{array.last}"
  end
end

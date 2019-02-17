class Api::V1::MessagesController < ApplicationController

  def index
    if current_user
      messages = Message.find_by_user(current_user)
      render json: MessageSerializer.new(messages)
    else
      render :json => {error: "Unauthorized"}, status: 403
    end

  end

end

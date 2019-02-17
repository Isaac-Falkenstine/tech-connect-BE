class Api::V1::MailersController < ApplicationController

  def create
    if current_user
      ConnectionRequestMailer.connect(message_params).deliver_now
      render :json => {success: "Email Sent"}, status: 200
    else
      render :json => {error: "Unauthorized"}, status: 403
    end
  end

private

  def message_params
    params.permit(:api_key, :connection_id, :datetime_1, :datetime_2, :datetime_3, :meeting_1, :meeting_2, :meeting_3)
  end

end

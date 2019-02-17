class Api::V1::MailersController < ApplicationController

  def create
    if current_user



      render :json => {success: "Email Sent"}, status: 200
    else
      render :json => {error: "Unauthorized"}, status: 403
    end

  end

  end

end

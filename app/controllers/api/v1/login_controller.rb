class Api::V1::LoginController < ApplicationController

  def create
    if valid_user?
      render json: ProfileSerializer.new(login_user)
    else
      render :json => {error: "Unauthorized."}, status: 401
    end
  end

private

  def login_params
    params.permit(:email, :password)
  end

  def login_user
  @user ||= User.find_by(email: login_params[:email])
end

def valid_user?
  login_user.authenticate(params[:password]) if login_user
end

end

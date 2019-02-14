class Api::V1::LoginController < ApplicationController

  def create
    if valid_user?
      render json: LoginSerializer.new(current_user)
    else
      render body: "Unauthorized", status: 401
    end
  end

private

  def login_params
    params.permit(:email, :password)
  end

  def current_user
  @user ||= User.find_by(email: login_params[:email])
end

def valid_user?
  current_user.authenticate(params[:password]) if current_user
end

end

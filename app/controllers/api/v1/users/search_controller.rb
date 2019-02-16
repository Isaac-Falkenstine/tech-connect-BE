class Api::V1::Users::SearchController < ApplicationController

  def index
    if current_user
      users = User.filter(user_params)
      render json: UserSerializer.new(users)
    else
      render :json => {error: "Unauthorized"}, status: 403
    end
  end

private

  def user_params
    params.permit(:name, :location, :employer, :position)
  end

end

class Api::V1::Users::SearchController < ApplicationController

  def index
    users = User.filter(user_params)

    #what serializer should be used for this?
    #want to return all users basic info that meets the filter
    render json: UserApiSerializer.new(user)
  end

private

  def user_params
    params.permit(:name, :location, :employer, :position)
  end

end

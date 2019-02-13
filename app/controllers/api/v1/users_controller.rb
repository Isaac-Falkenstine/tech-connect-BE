class Api::V1::UsersController<ApplicationController

  def create
    user = User.new(user_params)

    if user.api_key == nil
      user.api_key = user.make_key
    end

    if user.save
      render json: UserSerializer.new(user)
    else
      render :json => {error: "It looks like a user is already using that email! Please try again."}, status: 403
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end

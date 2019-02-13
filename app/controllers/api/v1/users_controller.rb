class Api::V1::UsersController<ApplicationController

  def create
    user = user_setup

    if user.save
      if check_password
        render json: UserSerializer.new(user)
      else
        render :json => {error: "The passwords don't match"}, status: 403
      end
    else
      render :json => {error: "That e-mail already exists."}, status: 403
    end
  end

  private

  def user_setup
    user = User.new(user_params)

    user.api_key = user.make_key
    return user
  end

  def check_password
    user_params[:password] == user_params[:password_confirmation]
  end

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end

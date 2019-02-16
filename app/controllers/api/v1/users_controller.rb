class Api::V1::UsersController<ApplicationController

  def create
    user = user_setup

    if user.save
      if check_password
        render json: UserApiSerializer.new(user)
      else
        render :json => {error: "The passwords don't match"}, status: 403
      end
    else
      render :json => {error: "That e-mail already exists."}, status: 403
    end
  end

  def update
    user = User.find_by(api_key: params[:api_key])
    if user
      user.update(update_params)

      render json: ProfileSerializer.new(user)
    else
      render :json => {error: "Unauthorized"}, status: 403
    end
  end

  def index
    users = User.all

    render json: UserSerializer.new(users)
  end

  def show
    current_user = User.find_by(api_key: params[:api_key])
    user = User.find(params[:id])

    if Message.connected?(current_user.id, user.id)
      render json: ConnectionSerializer.new(user)
    else
      render json: UserSerializer.new(user)
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

  def update_params
    user_changes_params = params.permit(:email, :name, :phone_number, :github, :linkedin, :bio)

    user_changes_params[:location_id] = Location.find_by(city: params[:location]).id
    user_changes_params[:position_id] = Position.find_by(job_title: params[:position]).id
    user_changes_params[:employer_id] = Employer.find_by(name: params[:employer]).id
    user_changes_params
  end
end

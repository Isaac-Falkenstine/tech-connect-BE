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
    if current_user
      current_user.update(update_params)

      render json: ProfileSerializer.new(current_user)
    else
      render :json => {error: "Unauthorized"}, status: 403
    end
  end

  def index
    if current_user
      users = User.all

      render json: UserSerializer.new(users)
    else
      render :json => {error: "Unauthorized"}, status: 403
    end
  end

  def show
    if current_user
      user = User.find(params[:id])

      if Message.connected?(current_user.id, user.id)
        render json: ConnectionSerializer.new(user)
      else
        render json: UserSerializer.new(user)
      end
    else
      render :json => {error: "Unauthorized"}, status: 403
    end
  end

  def destroy
    if current_user && current_user.id == params[:id].to_i
      user = User.find(params[:id])
      user.destroy
      render :json => {message: "#{user.name} has been deleted"}
    else
      render :json => {error: "Unauthorized"}, status: 403
    end
  end

  private

  def get_handle(github_url)
    github_url.split('/').last
  end

  def service(handle)
    GithubService.new(handle)
  end

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
    user_json = service(get_handle(params[:github])).user_json
    user_changes_params = params.permit(:email, :name, :phone_number, :github, :linkedin, :bio)

    user_changes_params[:photo] = user_json[:avatar_url]
    user_changes_params[:location_id] = Location.find_by(city: params[:location]).id
    user_changes_params[:position_id] = Position.find_by(job_title: params[:position]).id
    user_changes_params[:employer_id] = Employer.find_by(name: params[:employer]).id
    user_changes_params
  end
end

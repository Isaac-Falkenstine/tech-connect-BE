class ApplicationController < ActionController::API

  def current_user
    @current_user ||= User.find_by(api_key: params[:api_key])
  end

end

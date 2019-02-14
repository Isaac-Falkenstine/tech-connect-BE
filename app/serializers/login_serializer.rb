class LoginSerializer
  include FastJsonapi::ObjectSerializer

  attributes :api_key, :email, :name, :github, :linkedin, :bio, :phone_number, :location, :position, :employer

end

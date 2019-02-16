class PrivateUserSerializer
  include FastJsonapi::ObjectSerializer

  attributes :api_key, :name, :github, :linkedin, :bio, :location, :position, :employer
end

class UserSerializer
  include FastJsonapi::ObjectSerializer

  attributes :name, :github, :linkedin, :bio, :location, :position, :employer
end

class ConnectionSerializer
  include FastJsonapi::ObjectSerializer

  attributes :email, :phone_number, :name, :github, :linkedin, :bio, :location, :position, :employer
end

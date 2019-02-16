class ProfileSerializer
  include FastJsonapi::ObjectSerializer

  attributes :api_key, :id, :email, :name, :github, :linkedin, :bio, :phone_number, :location, :position, :employer, :connections

  attribute :connections do |object|
    object.get_connections(object.connections)
  end
end

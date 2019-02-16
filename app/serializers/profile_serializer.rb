class ProfileSerializer
  include FastJsonapi::ObjectSerializer

  attributes :api_key, :id, :email, :name, :github, :linkedin, :bio, :phone_number, :location, :position, :employer, :connections, :suggestions

  attribute :connections do |object|
    object.get_connections(object.connections)
  end

  attribute :suggestions do |object|
    object.get_suggestions(object)
  end
end

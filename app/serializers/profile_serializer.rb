class ProfileSerializer
  include FastJsonapi::ObjectSerializer

  attributes :api_key, :id, :email, :name, :github, :linkedin, :bio, :phone_number, :location, :position, :employer, :connections, :suggestions, :photo

  attribute :connections do |object|
    object.get_connections(object.connections)
  end

  attribute :suggestions do |object|
    if object.location_id
      object.get_suggestions(object)
    end
  end
end

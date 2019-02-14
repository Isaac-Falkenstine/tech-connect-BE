class LoginSerializer
  include FastJsonapi::ObjectSerializer

  attributes :api_key, :email, :name, :github, :linkedin, :bio, :phone_number, :location, :position, :employer

  attribute :connections do |object|
    object.all_connections(object.id)
  end

end
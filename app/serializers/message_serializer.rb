class MessageSerializer
  include FastJsonapi::ObjectSerializer

  attributes :user_id, :status, :meeting_date, :meeting_location, :created_at, :connection_id

  # attribute :connection_id do |object|
  #   binding.pry
  #   object.get_user(object.connection_id)
  # end

end

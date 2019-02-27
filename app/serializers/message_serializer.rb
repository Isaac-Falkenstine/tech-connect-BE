class MessageSerializer
  include FastJsonapi::ObjectSerializer

  attributes :sender, :receiver, :status, :meeting_date, :meeting_location, :created_at

  attribute :sender do |object|
    User.get_user_info(object.user_id)
  end

  attribute :receiver do |object|
    User.get_user_info(object.connection_id)
  end

end

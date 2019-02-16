class UserApiSerializer
  include FastJsonapi::ObjectSerializer

  attribute :api_key
end

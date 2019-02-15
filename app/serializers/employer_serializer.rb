class EmployerSerializer
  include FastJsonapi::ObjectSerializer

  attribute :name, :site_url
end

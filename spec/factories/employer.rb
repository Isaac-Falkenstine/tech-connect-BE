FactoryBot.define do
  factory :employer do
    name   { |n| "Name number#{n}" }
    site_url   { |n| "www.#{n}.com" }
  end
end

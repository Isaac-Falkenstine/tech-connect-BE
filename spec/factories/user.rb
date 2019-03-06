FactoryBot.define do
  factory :user do
    name   { |n| "Name #{n}" }
    password_digest   { |n| "#{n}" }
    email   { |n| "#{n}@gmail.com" }
    phone_number   { |n| 123 }
    github   { |n| "github.com/#{n}" }
    linkedin   { |n| "linkedin.com/#{n}" }
    bio   { |n| "I like #{n} pizzas" }
    api_key   { |n| "#{n}123" }
    photo { "https://picsum.photos/200"}
    location
    position
    employer
  end
end

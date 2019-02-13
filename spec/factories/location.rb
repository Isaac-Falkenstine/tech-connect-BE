FactoryBot.define do
  factory :location do
    city   { |n| "City number#{n}" }
  end
end

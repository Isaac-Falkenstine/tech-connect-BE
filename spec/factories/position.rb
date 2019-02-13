FactoryBot.define do
  factory :position do
    job_title   { |n| "Job #{n}" }
  end
end

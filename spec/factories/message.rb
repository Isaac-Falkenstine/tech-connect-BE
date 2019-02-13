FactoryBot.define do
  factory :message do
    status   { |n| "Status #{n}" }
    meeting_date { |n| "Meeting Date #{n}" }
    meeting_location { |n| "Meeting Location #{n}" }

    user
    connection {|n| user }
  end
end

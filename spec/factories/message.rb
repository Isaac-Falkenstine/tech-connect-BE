require 'date'

FactoryBot.define do
  factory :message do
    status   { |n| "Status #{n}" }
    meeting_date { |n| DateTime.new(2001,2,3,4,5,6) }
    meeting_location { |n| "Meeting Location #{n}" }
    token { "abc123" }
    user
    connection {|n| user }
  end
end

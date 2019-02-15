require 'faker'

Location.create(city: "N/A")
Employer.create(name: "Unemployed", site_url: "N/A")
Position.create(job_title: "Unemployed")

registered = User.create(name: "Registered Joe", email: "registered@email.com", password: "password123", api_key: "987654321123")
second_user = User.create(name: "Second Joe", email: "second@email.com", password: "password123", api_key: "121212343434")

denver = Location.create(city: "Denver,CO")
turing = Employer.create(name: "Turing", site_url: "turing.io")
employee = Position.create(job_title: "Backend Instructor")
updated = User.create(
            name: "Updated Joe",
            email: "updated@email.com",
            password: "password123",
            phone_number: 3031234567,
            github:"github.com/user/joe",
            linkedin: "linkedin.com/users/joe",
            bio:"Hey everyone, my name is Joe! I'm really trying to get into the tech world! HELP!",
            api_key: "1234567891011121",
            location_id: denver.id,
            employer_id: turing.id,
            position_id: employee.id)

message_1 = Message.create(user_id: registered.id, connection_id: updated.id, status: "Confirmed", meeting_date: DateTime.new(2001,2,3,4,5,6), meeting_location: "Starbucks on Colorado")
message_2 = Message.create(user_id: registered.id, connection_id: second_user.id, status: "Confirmed", meeting_date: DateTime.new(2002,2,6,9,5,1), meeting_location: "Dazbog on Blake")

# Everyone in Denver
  4.times do
    company = Faker::Company.unique.name
    employer = Employer.create(name: company, site_url: "#{company}.com")
    position = Position.create(job_title: Faker::Company.unique.profession)

    user = User.create(name: Faker::FunnyName.two_word_name,
                email: Faker::Internet.unique.email,
                password: Faker::Internet.password,
                phone_number: rand(1000000000..9999999999),
                github: Faker::Internet.url('github.com'),
                linkedin: Faker::Internet.url('linkedin.com'),
                bio: Faker::Hipster.paragraph,
                api_key: SecureRandom.urlsafe_base64(12),
                location_id: denver.id,
                employer_id: employer.id,
                position_id: position.id)

  Message.create(user_id: registered.id, connection_id: user.id, status: "Confirmed", meeting_date: DateTime.new(2001,2,3,4,5,6), meeting_location: Faker::Lorem.word)
  end
  #Everyone at google
  google = Employer.create(name: "Google", site_url: "google.com")

    4.times do
      position = Position.create(job_title: Faker::Company.unique.profession)

      user = User.create(name: Faker::FunnyName.two_word_name,
                  email: Faker::Internet.unique.email,
                  password: Faker::Internet.password,
                  phone_number: rand(1000000000..9999999999),
                  github: Faker::Internet.url('github.com'),
                  linkedin: Faker::Internet.url('linkedin.com'),
                  bio: Faker::Hipster.paragraph,
                  api_key: SecureRandom.urlsafe_base64(12),
                  location_id: denver.id,
                  employer_id: google.id,
                  position_id: position.id)

      Message.create(user_id: updated.id, connection_id: user.id, status: "Confirmed", meeting_date: DateTime.new(2001,2,3,4,5,6), meeting_location: Faker::Lorem.word)
    end
    # Everyone as a software developer
      backend = Position.create(job_title: "Backend Software Developer")
      4.times do
        user = User.create(name: Faker::FunnyName.two_word_name,
                    email: Faker::Internet.unique.email,
                    password: Faker::Internet.password,
                    phone_number: rand(1000000000..9999999999),
                    github: Faker::Internet.url('github.com'),
                    linkedin: Faker::Internet.url('linkedin.com'),
                    bio: Faker::Hipster.paragraph,
                    api_key: SecureRandom.urlsafe_base64(12),
                    location_id: denver.id,
                    employer_id: google.id,
                    position_id: backend.id)
        Message.create(user_id: second_user.id, connection_id: user.id, status: "Confirmed", meeting_date: DateTime.new(2002,2,6,9,5,1), meeting_location: Faker::Lorem.word)
      end
    # end Backend Software Developer
  # end google
# end denver


12.times do
  company = Faker::Company.unique.name
  location = Location.create(city: Faker::Address.unique.city)
  employer = Employer.create(name: Faker::Company.unique.name, site_url: "#{company}.com")
  position = Position.create(job_title: Faker::Company.unique.profession)

  User.create(name: Faker::FunnyName.two_word_name,
              email: Faker::Internet.email,
              password: Faker::Internet.password,
              phone_number: rand(1000000000..9999999999),
              github: Faker::Internet.url('github.com'),
              linkedin: Faker::Internet.url('linkedin.com'),
              bio: Faker::GreekPhilosophers.quote,
              api_key: SecureRandom.urlsafe_base64(12),
              location_id: location.id,
              employer_id: employer.id,
              position_id: position.id)
end

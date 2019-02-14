registered = User.create(id: 1, name: "Registered Joe", email: "registered@email.com", password: "password123")
second_user = User.create(id: 3, name: "Second Joe", email: "second@email.com", password: "password123")

location = Location.create(city: "Denver,CO")
employer = Employer.create(name: "Turing", site_url: "turing.io")
position = Position.create(job_title: "Employee")
updated = User.create(id: 2,
            name: "Updated Joe",
            email: "updated@email.com",
            password: "password123",
            phone_number: 3031234567,
            github:"github.com/user/joe",
            linkedin: "linkedin.com/users/joe",
            bio:"Hey everyone, my name is Joe! I'm really trying to get into the tech world! HELP!",
            api_key: "1234567891011121",
            location_id: location.id,
            employer_id: employer.id,
            position_id: position.id)

message_1 = Message.create(user_id: registered.id, connection_id: updated.id, status: "Confirmed", meeting_date: DateTime.new(2001,2,3,4,5,6), meeting_location: "Starbucks on Colorado")
message_2 = Message.create(user_id: registered.id, connection_id: second_user.id, status: "Confirmed", meeting_date: DateTime.new(2002,2,6,9,5,1), meeting_location: "Dazbog on Blake")

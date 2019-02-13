registered = User.create(name: "Registered Joe", email: "example@email.com", password: "password123")
location = Location.create(city: "Denver,CO")
employer = Employer.create(name: "Turing", site_url: "turing.io")
position = Position.create(job_title: "Employee")
updated = User.create(name: "Updated Joe",
            email: "email@example.com",
            password: "password123",
            phone_number: 3031234567,
            github:"github.com/user/joe",
            linkedin: "linkedin.com/users/joe",
            bio:"Hey everyone, my name is Joe! I'm really trying to get into the tech world! HELP!",
            api_key: "1234567891011121",
            location_id: location.id,
            employer_id: employer.id,
            position_id: position.id)

Message.create(user_id: registered.id, connection_id: updated.id, status: "Confirmed", meeting_date: DateTime.new(2001,2,3,4,5,6), meeting_location: "Starbucks on Colorado")

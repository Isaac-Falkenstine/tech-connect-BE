# TechConnect

**Production Base URL:**
```shell
https://tech-connect-be.herokuapp.com
```

**Local Base URL:**
```shell
http://localhost:3000
```

**Database Schema**
![alt text](/assets/schema.png)

**User Registration Request:**
```shell
POST /api/v1/users
Body: {"email": "email@example.com", "password": "password", "password_confirmation": "password"}
```

**User Registration Response (Success):**
```shell
{
    "data": {
        "id": "1",
        "type": "user",
        "attributes": {
            "api_key": "7-d8JIf8BR9sdDQd"
        }
    }
}
```

**User Registration Response (Failure if User's email is already in the system):**
```shell
{
    "error": "That e-mail already exists."
}
```

**User Registration Response (Failure if User's password does not match password confirmation):**
```shell
{
    "error": "The passwords don't match"
}
```

**User Login Request:**
```shell
POST /api/v1/login
Body: {"email": "email@example.com", "password": "password"}
```

**User Login Response (Success):**
```shell
{
    "data": {
        "id": "1",
        "type": "login",
        "attributes": {
            "api_key": null,
            "email": "registered@email.com",
            "name": "Registered Joe",
            "github": null,
            "linkedin": null,
            "bio": null,
            "phone_number": null,
            "location": null,
            "position": null,
            "employer": null,
            "connections": [
                {
                    "id": 2,
                    "name": "Updated Joe",
                    "email": "updated@email.com"
                },
                {
                    "id": 3,
                    "name": "Second Joe",
                    "email": "second@email.com"
                }
            ]
        }
    }
}

```

**User Login Response (Failure if User does not exist or Password is incorrect):**
```shell
{
    "error": "Unauthorized."
}
```

**User Update Request:**
```shell
PATCH /api/v1/users
Body: {"api_key": "1234567891011121",
              "name": "Joe Shmoe",
              "email": "email@gmail.com",
              "bio": "Hey guys!",
              "github": "github.com/user/joe",
              "linkedin": "linkedin.com/user/joe",
              "phone_number": "7204908123",
              "location": "Denver,CO",
              "employer": "Turing",
              "position": "Employee"}
```

**User Update Response (Success):**
```shell
{
    "data": {
        "id": "2",
        "type": "profile",
        "attributes": {
            "api_key": "1234567891011121",
            "email": "email@gmail.com",
            "name": "Joe Shmoe",
            "github": "github.com/user/joe",
            "linkedin": "linkedin.com/user/joe",
            "bio": "Hey guys!",
            "phone_number": 7204908123,
            "location": {
                "id": 2,
                "city": "Denver,CO",
                "created_at": "2019-02-14T21:53:44.430Z",
                "updated_at": "2019-02-14T21:53:44.430Z"
            },
            "position": {
                "id": 2,
                "job_title": "Employee",
                "created_at": "2019-02-14T21:53:44.434Z",
                "updated_at": "2019-02-14T21:53:44.434Z"
            },
            "employer": {
                "id": 2,
                "name": "Turing",
                "site_url": "turing.io",
                "created_at": "2019-02-14T21:53:44.432Z",
                "updated_at": "2019-02-14T21:53:44.432Z"
            },
            "connections": [
                {
                    "id": 2,
                    "name": "Updated Joe",
                    "email": "updated@email.com"
                },
                {
                    "id": 3,
                    "name": "Second Joe",
                    "email": "second@email.com"
                }
            ]
        }
    }
}
```

**User Update Response (Failure if api_key is not passed in or datatype is not correct for each attribute):**
```shell
{
    "error": "Unauthorized"
}
```

**Get All Locations Request:**
```shell
GET /api/v1/locations
```

**Get All Locations Response (Success):**
```shell
{
    "data": [
        {
            "id": "1",
            "type": "location",
            "attributes": {
                "city": "N/A"
            }
        },
        {
            "id": "2",
            "type": "location",
            "attributes": {
                "city": "Denver,CO"
            }
        }
    ]
}
```

**Get All Positions Request:**
```shell
GET /api/v1/positions
```

**Get All Positions Response (Success):**
```shell
{
    "data": [
        {
            "id": "1",
            "type": "position",
            "attributes": {
                "job_title": "Unemployed"
            }
        },
        {
            "id": "2",
            "type": "position",
            "attributes": {
                "job_title": "Jr Engineer"
            }
        }
    ]
}
```

**Get All Employers Request:**
```shell
GET /api/v1/employers
```

**Get All Employers Response (Success):**
```shell
{
    "data": [
        {
            "id": "1",
            "type": "employer",
            "attributes": {
                "name": "Unemployed",
                "site_url": "N/A"
            }
        },
        {
            "id": "2",
            "type": "employer",
            "attributes": {
                "name": "Turing",
                "site_url": "turing.io"
            }
        },
        {
            "id": "3",
            "type": "employer",
            "attributes": {
                "name": "Google",
                "site_url": "google.com"
            }
        }
      ]
}
```
**Get All Users Request:**
```shell
GET /api/v1/users
```

**Get All Users Response (Success):**
```shell
{
    "data": [
        {
            "id": "3",
            "type": "user",
            "attributes": {
                "api_key": "1234567891011121",
                "email": "updated@email.com",
                "name": "Updated Joe",
                "github": "github.com/user/joe",
                "linkedin": "linkedin.com/users/joe",
                "bio": "Hey everyone, my name is Joe! I'm really trying to get into the tech world! HELP!",
                "phone_number": 3031234567,
                "location": {
                    "id": 2,
                    "city": "Denver,CO",
                    "created_at": "2019-02-15T23:11:40.016Z",
                    "updated_at": "2019-02-15T23:11:40.016Z"
                },
                "position": {
                    "id": 2,
                    "job_title": "Backend Instructor",
                    "created_at": "2019-02-15T23:11:40.020Z",
                    "updated_at": "2019-02-15T23:11:40.020Z"
                },
                "employer": {
                    "id": 2,
                    "name": "Turing",
                    "site_url": "turing.io",
                    "created_at": "2019-02-15T23:11:40.018Z",
                    "updated_at": "2019-02-15T23:11:40.018Z"
                }
            }
        },
        {
            "id": "4",
            "type": "user",
            "attributes": {
                "api_key": "TF08lHZfTLhU5ifY",
                "email": "jarod@luettgen.info",
                "name": "Lily Livard",
                "github": "http://github.com/yaeko_mills",
                "linkedin": "http://linkedin.com/shane_grant",
                "bio": "Hella swag keytar health freegan chicharrones. Forage viral chicharrones butcher cray kitsch jean shorts. Irony hoodie bespoke.",
                "phone_number": 8289620063,
                "location": {
                    "id": 2,
                    "city": "Denver,CO",
                    "created_at": "2019-02-15T23:11:40.016Z",
                    "updated_at": "2019-02-15T23:11:40.016Z"
                },
                "position": {
                    "id": 3,
                    "job_title": "philosopher",
                    "created_at": "2019-02-15T23:11:40.361Z",
                    "updated_at": "2019-02-15T23:11:40.361Z"
                },
                "employer": {
                    "id": 3,
                    "name": "Wisoky Group",
                    "site_url": "Wisoky Group.com",
                    "created_at": "2019-02-15T23:11:40.353Z",
                    "updated_at": "2019-02-15T23:11:40.353Z"
                }
            }
        },
        {
            "id": "5",
            "type": "user",
            "attributes": {
                "api_key": "6opkqd2dIhkkR0vn",
                "email": "maryjane@kuhlman.name",
                "name": "Terry Bull",
                "github": "http://github.com/grisel",
                "linkedin": "http://linkedin.com/trey.ryan",
                "bio": "Viral post-ironic cray park pbr&b offal helvetica letterpress. Chia ugh plaid xoxo loko green juice. Church-key kickstarter thundercats chicharrones. Kickstarter blue bottle hashtag. Helvetica sriracha bitters.",
                "phone_number": 8795796491,
                "location": {
                    "id": 2,
                    "city": "Denver,CO",
                    "created_at": "2019-02-15T23:11:40.016Z",
                    "updated_at": "2019-02-15T23:11:40.016Z"
                },
                "position": {
                    "id": 4,
                    "job_title": "astronomer",
                    "created_at": "2019-02-15T23:11:40.441Z",
                    "updated_at": "2019-02-15T23:11:40.441Z"
                },
                "employer": {
                    "id": 4,
                    "name": "Halvorson LLC",
                    "site_url": "Halvorson LLC.com",
                    "created_at": "2019-02-15T23:11:40.439Z",
                    "updated_at": "2019-02-15T23:11:40.439Z"
                }
            }
        }
    ]
}

```

**Seed Data:**
```shell
Location.create(city: "N/A")
Employer.create(name: "Unemployed", site_url: "N/A")
Position.create(job_title: "Unemployed")

registered = User.create(name: "Registered Joe", email: "registered@email.com", password: "password123", api_key: "987654321123")
second_user = User.create(name: "Second Joe", email: "second@email.com", password: "password123", api_key: "192837465192")

denver = Location.create(city: "Denver")
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
```

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
            "id": 1,
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
            "id": 1,
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
                  "id": 11,
                  "name": "Iona Ford",
                  "city": "Denver",
                  "company": "Google",
                  "job_title": "attorney at law"
                },
                {
                  "id": 8,
                  "name": "Ty Tannick",
                  "city": "Denver",
                  "company": "Google",
                  "job_title": "librarian"
                }
            ],
            "suggestions": [
                 {
                     "id": 10,
                     "name": "Chuck Roast",
                     "city": "Denver",
                     "company": "Google",
                     "job_title": "physicist"
                 },
                 {
                     "id": 13,
                     "name": "Pete Moss",
                     "city": "Denver",
                     "company": "Google",
                     "job_title": "Backend Software Developer"
                 },
                 {
                     "id": 3,
                     "name": "Updated Joe",
                     "city": "Denver",
                     "company": "Turing",
                     "job_title": "Backend Instructor"
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
              "location": "Denver",
              "employer": "Turing",
              "position": "Backend Instructor"}
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
                "city": "Denver",
                "created_at": "2019-02-14T21:53:44.430Z",
                "updated_at": "2019-02-14T21:53:44.430Z"
            },
            "position": {
                "id": 2,
                "job_title": "Backend Instructor",
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
                "city": "Denver"
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
Body: {"api_key": "1234567891011121"}
```

**Get All Users by Filter Request:**
```shell
GET /api/v1/users/find?name=first-or-last-name
Body: {"api_key": "1234567891011121"}
```

```shell
GET /api/v1/users/find?city=city-name
Body: {"api_key": "1234567891011121"}
```

```shell
GET /api/v1/users/find?employer=employer-name
Body: {"api_key": "1234567891011121"}
```

```shell
GET /api/v1/users/find?position=position-job_title
Body: {"api_key": "1234567891011121"}
```

**Get All Users Response (with or without filters) (Success):**
```shell
{
    "data": [
        {
            "id": "3",
            "type": "user",
            "attributes": {
                "name": "Updated Joe",
                "github": "github.com/user/joe",
                "linkedin": "linkedin.com/users/joe",
                "bio": "Hey everyone, my name is Joe! I'm really trying to get into the tech world! HELP!",
                "location": {
                    "id": 2,
                    "city": "Denver",
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
                "name": "Lily Livard",
                "github": "http://github.com/yaeko_mills",
                "linkedin": "http://linkedin.com/shane_grant",
                "bio": "Hella swag keytar health freegan chicharrones. Forage viral chicharrones butcher cray kitsch jean shorts. Irony hoodie bespoke.",
                "location": {
                    "id": 2,
                    "city": "Denver",
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
                "name": "Terry Bull",
                "github": "http://github.com/grisel",
                "linkedin": "http://linkedin.com/trey.ryan",
                "bio": "Viral post-ironic cray park pbr&b offal helvetica letterpress. Chia ugh plaid xoxo loko green juice. Church-key kickstarter thundercats chicharrones. Kickstarter blue bottle hashtag. Helvetica sriracha bitters.",
                "location": {
                    "id": 2,
                    "city": "Denver",
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

**All Users Response (Failure if api_key is not passed in):**
```shell
{
    "error": "Unauthorized"
}
```


**Get A Single User Request:**
```shell
GET /api/v1/users/:id
Body: {"api_key": "1234567891011121"}
```

**Get A Single User Response (Success, With Connections):**
```shell
{
    "data": {
        "id": "4",
        "type": "connection",
        "attributes": {
            "email": "brett@okeefe.io",
            "phone_number": 9906780031,
            "name": "Haywood Jashootmee",
            "github": "http://github.com/ursula.schumm",
            "linkedin": "http://linkedin.com/saul",
            "bio": "Semiotics kinfolk sartorial. Keffiyeh vinyl cleanse hella distillery. Yolo xoxo chicharrones wolf paleo meggings direct trade. Wayfarers mixtape migas blue bottle pour-over. Flannel pug tacos kombucha.",
            "location": {
                "id": 2,
                "city": "Denver",
                "created_at": "2019-02-16T16:32:09.669Z",
                "updated_at": "2019-02-16T16:32:09.669Z"
            },
            "position": {
                "id": 3,
                "job_title": "musician",
                "created_at": "2019-02-16T16:32:09.998Z",
                "updated_at": "2019-02-16T16:32:09.998Z"
            },
            "employer": {
                "id": 3,
                "name": "Senger Inc",
                "site_url": "Senger Inc.com",
                "created_at": "2019-02-16T16:32:09.989Z",
                "updated_at": "2019-02-16T16:32:09.989Z"
            }
        }
    }
}

```

**Get A Single User Response (Success, Without A Connection):**
```shell
{
    "data": {
        "id": "14",
        "type": "user",
        "attributes": {
            "name": "Midas Well",
            "github": "http://github.com/lowell_hane",
            "linkedin": "http://linkedin.com/lynette.abshire",
            "bio": "Mixtape yolo banh mi readymade mustache kitsch occupy leggings. Tousled asymmetrical craft beer poutine salvia bicycle rights. Trust fund yuccie pug hashtag ennui. Synth fanny pack beard semiotics bicycle rights craft beer dreamcatcher. Aesthetic selvage hammock bespoke.",
            "location": {
                "id": 2,
                "city": "Denver",
                "created_at": "2019-02-16T16:32:09.669Z",
                "updated_at": "2019-02-16T16:32:09.669Z"
            },
            "position": {
                "id": 11,
                "job_title": "Backend Software Developer",
                "created_at": "2019-02-16T16:32:10.530Z",
                "updated_at": "2019-02-16T16:32:10.530Z"
            },
            "employer": {
                "id": 7,
                "name": "Google",
                "site_url": "google.com",
                "created_at": "2019-02-16T16:32:10.270Z",
                "updated_at": "2019-02-16T16:32:10.270Z"
            }
        }
    }
}
```

**Single User Response (Failure if api_key is not passed in):**
```shell
{
    "error": "Unauthorized"
}
```

**DELETE A Single User Request:**
```shell
DELETE /api/v1/users/:id
Body: {"api_key": "1234567891011121"}
```

**Delete A Single User Response (Success):**
```shell
{
    "message": "Registered Joe has been deleted"
}
```

**Delete User Response (Failure if api_key is not passed in or if the api_key user does not match the id passed in):**
```shell
{
    "error": "Unauthorized"
}
```

**Get All Messages Request:**
```shell
GET /api/v1/messages
Body: {"api_key": "1234567891011121"}
```

**Get All Messages Response (Success):**
```shell
{
    "data": [
        {
            "id": "1",
            "type": "message",
            "attributes": {
                "sender": "Registered Joe",
                "receiver": "Updated Joe",
                "status": "Confirmed",
                "meeting_date": "2001-02-03T04:05:06.000Z",
                "meeting_location": "Starbucks on Colorado",
                "created_at": "2019-02-16T18:17:43.939Z"
            }
        },
        {
            "id": "7",
            "type": "message",
            "attributes": {
                "sender": "Updated Joe",
                "receiver": "Royal Payne",
                "status": "Confirmed",
                "meeting_date": "2001-02-03T04:05:06.000Z",
                "meeting_location": "ut",
                "created_at": "2019-02-16T18:17:44.482Z"
            }
        },
        {
            "id": "8",
            "type": "message",
            "attributes": {
                "sender": "Updated Joe",
                "receiver": "Brooke Trout",
                "status": "Confirmed",
                "meeting_date": "2001-02-03T04:05:06.000Z",
                "meeting_location": "accusantium",
                "created_at": "2019-02-16T18:17:44.548Z"
            }
        }
    ]
}
```

*Get All Messages Response (Failure if api_key is not passed):**
```shell
{
    "error": "Unauthorized"
}
```

**Send Email to Connect Request:**
```shell
POST /api/v1/mailers
Body: {
  "api_key" : "1234567891011121",
  "connection_id": "1",
  "datetime_1": "2019-02-16 18:17:43",
  "datetime_2": "2019-02-17 18:17:43",
  "datetime_3": "2019-02-18 18:17:43",
  "meeting_1": "Starbucks on Broadway",
  "meeting_2": "Dazbog on 17th",
  "meeting_3": "Coffehouse on Champa"
}
```

**Send Email Response (Success):**
```shell
{
    "success": "Email Sent"
}
```

*Send Email Response (Failure if api_key is not passed):**
```shell
{
    "error": "Unauthorized"
}
```

**Post Confirmation Message Request:**
```shell
POST /api/v1/users/:id/messages?email=email&status=confirmed
Body: { "meeting_location": "Starbucks on Broadway",
        "meeting_date": "02-07-2019 06:17",
        "make-meeting": ""
}
```

**Confirm Email Response (Success):**
```shell
{
    "You have confirmed your meeting"
}
```

**Post Decline Message Request:**
```shell
POST /api/v1/users/:id/messages?email=email&status=declined
Body: { "meeting_location": "N/A",
        "meeting_date": "00-00-0000 00:00",
        "rain-check": ""
}
```

**Decline Email Response (Success):**
```shell
{
    "You have declined the meeting request"
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

**Email Templates**
![alt text](/assets/request_email.png)
![alt text](/assets/confirm_email.png)
![alt text](/assets/raincheck_email.png)

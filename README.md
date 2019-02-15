#TechConnect

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

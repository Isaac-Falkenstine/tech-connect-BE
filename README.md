
**Production Base URL:**
```shell
https://tech-connect-be.herokuapp.com
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
POST /api/v1/users
Body: {"email": "email@example.com", "password": "password"}
```

**User Login Response (Success):**

```shell
{
    "data": {
        "id": "2",
        "type": "login",
        "attributes": {
            "api_key": "1234567891011121",
            "email": "email@example.com",
            "name": "Updated Joe",
            "github": "github.com/user/joe",
            "linkedin": "linkedin.com/users/joe",
            "bio": "Hey everyone, my name is Joe! I'm really trying to get into the tech world! HELP!",
            "phone_number": 3031234567,
            "location": {
                "id": 1,
                "city": "Denver,CO",
                "created_at": "2019-02-13T22:52:20.176Z",
                "updated_at": "2019-02-13T22:52:20.176Z"
            },
            "position": {
                "id": 1,
                "job_title": "Employee",
                "created_at": "2019-02-13T22:52:20.213Z",
                "updated_at": "2019-02-13T22:52:20.213Z"
            },
            "employer": {
                "id": 1,
                "name": "Turing",
                "site_url": "turing.io",
                "created_at": "2019-02-13T22:52:20.197Z",
                "updated_at": "2019-02-13T22:52:20.197Z"
            },
            "connections": [
                {
                    "id": 1,
                    "name": "Registered Joe",
                    "email": "example@email.com",
                    "phone_number": null,
                    "github": null,
                    "linkedin": null,
                    "bio": null,
                    "api_key": null,
                    "location_id": null,
                    "employer_id": null,
                    "position_id": null,
                    "created_at": "2019-02-13T22:52:20.155Z",
                    "updated_at": "2019-02-13T22:52:20.155Z"
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

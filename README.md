
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

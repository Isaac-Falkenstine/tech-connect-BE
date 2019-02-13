
Production Base URL:
```shell 
https://tech-connect-be.herokuapp.com
```

User Registration Request:
```shell
POST /api/v1/users
Body: {"email": "email@example.com", "password": "password", "password_confirmation": "password"}
```

User Registration Response (Success):

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

User Registration Response (Failure if User's email is already in the system):

```shell
{
    "error": "That e-mail already exists."
}
```

User Registration Response (Failure if User's password does not match password confirmation):

```shell
{
    "error": "The passwords don't match"
}
```

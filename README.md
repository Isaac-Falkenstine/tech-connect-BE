POST /api/v1/users
Body: {"email": "email@example.com", "password": "password", "password_confirmation": "password"}
Example response:
{
    "data": {
        "id": "1",
        "type": "user",
        "attributes": {
            "api_key": "7-d8JIf8BR9sdDQd"
        }
    }
}

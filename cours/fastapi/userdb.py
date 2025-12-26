from fastapi import FastAPI, HTTPException

users_db = [
    {'user_id': 1, 'name': 'Alice', 'subscription': 'free tier'},
    {'user_id': 2, 'name': 'Bob', 'subscription': 'premium tier'},
    {'user_id': 3, 'name': 'Clementine', 'subscription': 'free tier'}
]

api = FastAPI()

@api.get("/")
def get_index():
    return {"greetings": "welcome"}

@api.get("/users")
def get_users():
    return users_db

@api.get("/users/{userid}")
def get_user(userid: int):
    for user in users_db:
        if user['user_id'] == userid:
            return user
    raise HTTPException(status_code=404, detail="User not found")

@api.get("/users/{userid}/name")
def get_user_name(userid: int):
    for user in users_db:
        if user['user_id'] == userid:
            return {"name": user["name"]}
    raise HTTPException(status_code=404, detail="User not found")

@api.get("/users/{userid}/subscription")
def get_user_subscription(userid: int):
    for user in users_db:
        if user['user_id'] == userid:
            return {"subscription": user["subscription"]}
    raise HTTPException(status_code=404, detail="User not found")
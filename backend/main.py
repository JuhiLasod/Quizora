from fastapi import FastAPI, HTTPException
from pymongo import MongoClient
from dotenv import load_dotenv
from model import Users
import os
load_dotenv()

app=FastAPI()

client=MongoClient(os.getenv("MONGO_URI"))
db=client["Quizora"]
collection=db["Users"]

@app.get("/")
def root():
    return {"message": "backend running"}

@app.post("/users")
def users(user: Users):
    collection.insert_one(user.dict())
    return {"message": "user added"}

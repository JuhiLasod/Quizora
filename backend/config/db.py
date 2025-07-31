from fastapi import FastAPI
from pymongo import MongoClient
from dotenv import load_dotenv
import os
app=FastAPI()
load_dotenv()
client= MongoClient(os.getenv("MONGO_URI"))
db=client["Quizora"]
QuizesColl=db["Quizes"]
ScoreColl=db["Scores"]
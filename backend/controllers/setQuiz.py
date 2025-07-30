from config.db import QuizesColl
from models.Quizes import Quizes

def add_ques(quiz:Quizes):
    print("reachef to cont")
    QuizesColl.insert_one(quiz.dict())
    return 

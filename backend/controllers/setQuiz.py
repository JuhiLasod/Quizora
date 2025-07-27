from config.db import QuizesColl
from models.Quizes import Quizes

def add_ques():
    # QuizesColl.insert_one(q.dict())
    return {"message": "quiz added"}

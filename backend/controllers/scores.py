from config.db import ScoreColl
from config.db import QuizesColl
from models.Scores import Scores
from fastapi.responses import JSONResponse
from bson import json_util

def set_score(score:Scores):
    ScoreColl.insert_one(score.dict())
    return

def fetch_total(title:str):
    # print("inside req controller")
    total=QuizesColl.find_one({'title':title},{'_id':0 , 'total':1})
    return JSONResponse(content=json_util.loads(json_util.dumps(total)))

from config.db import QuizesColl
# from models.Quizes import Quizes
from fastapi.responses import JSONResponse
from bson import json_util



def fetch_ques(title: str):
    quiz=QuizesColl.find_one({'title':title},{'_id':0})
    if(quiz):
        return JSONResponse(content=json_util.loads(json_util.dumps(quiz)))    
    else:
        return "not found"
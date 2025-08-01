from config.db import ScoreColl
from models.Scores import Scores

def set_score(score:Scores):
    ScoreColl.insert_one(score.dict())
    return
from config.db import QuizesColl
from models.Quizes import Quizes
from typing import List

def fetch_quizes():
    titles_cursor= QuizesColl.find({},{'title':1})
    titles=[ quizes['title'] for quizes in titles_cursor]
    return {'titles':titles}

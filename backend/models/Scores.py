from pydantic import BaseModel

class Scores(BaseModel):
    title:str
    name: str
    score: int


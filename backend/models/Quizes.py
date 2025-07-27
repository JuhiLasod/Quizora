from pydantic import BaseModel , Field
from typing import List

class question(BaseModel):
    ques: str
    options: List[str]= Field(...,min_items=4,max_items=4)
    ans: str
class Quizes(BaseModel):
    title: str
    Questions: List[question]
from fastapi import APIRouter
from models.Quizes import Quizes
from controllers import setQuiz

router=APIRouter()

@router.post("/set-quiz")
def add_ques():
    return setQuiz.add_ques()
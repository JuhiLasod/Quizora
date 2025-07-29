from fastapi import APIRouter
from models.Quizes import Quizes
from controllers import setQuiz

router=APIRouter()

@router.post("/set-quiz")
# print("this is routes")
def add_ques(quiz: Quizes):
    print("reachef to routes")
    return setQuiz.add_ques(quiz)
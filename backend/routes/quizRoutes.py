from fastapi import APIRouter, Body
from models.Quizes import Quizes
from models.Scores import Scores
from controllers import setQuiz
from controllers import fetchQuizes
from controllers import fetchQues
from controllers import scores

router=APIRouter()

@router.post("/set-quiz")
# print("this is routes")
def add_ques(quiz: Quizes):
    print("reachef to routes")
    return setQuiz.add_ques(quiz)

@router.get("/fetch-quizes")
def fetch_quizes():
    return fetchQuizes.fetch_quizes()

@router.get("/fetch-ques")
def fetch_ques(title: str):
    return fetchQues.fetch_ques(title)

@router.post("/set-score")
def set_score(score: Scores):
    return scores.set_score(score)

@router.get("/fetch-total")
def fetch_total(title:str):
    return scores.fetch_total(title)
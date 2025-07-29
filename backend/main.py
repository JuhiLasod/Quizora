from fastapi import FastAPI
# from routes import quizRoutes
from routes.quizRoutes import router as quiz_router

app=FastAPI()
@app.get("/")
def root():
    return {"message": "FastAPI is working"}
print("reachef to main")
app.include_router(quiz_router, prefix="/quiz")
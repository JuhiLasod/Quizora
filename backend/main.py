from fastapi import FastAPI
# from routes import quizRoutes
from routes.quizRoutes import router as quiz_router

app=FastAPI()
print("reachef to main")
app.include_router(quiz_router)
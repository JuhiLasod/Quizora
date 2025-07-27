from fastapi import FastAPI
from routes import quizRoutes

app=FastAPI()
app.include_router(quizRoutes.router)
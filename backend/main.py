from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
# from routes import quizRoutes
from routes.quizRoutes import router as quiz_router

app=FastAPI()
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)
@app.get("/")
def root():
    return {"message": "FastAPI is working"}
print("reachef to main")
app.include_router(quiz_router, prefix="/quiz")
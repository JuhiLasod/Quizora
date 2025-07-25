from fastapi import FastAPI

app=FastAPI()
@app.get("/")
def first():
    print("hellooooooo")
    return "hello juhi"
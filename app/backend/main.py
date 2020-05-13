from fastapi import FastAPI
from .tasks import number_of_tokens


app = FastAPI()


@app.post("/run")
def run(text: str):
    res = number_of_tokens.delay(text)
    return {"result": res.get()}

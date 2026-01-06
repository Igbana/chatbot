from fastapi import FastAPI
from pydantic import BaseModel
from fastapi.middleware.cors import CORSMiddleware
from openai import OpenAI
import os
from dotenv import load_dotenv
load_dotenv()

class ChatRequest(BaseModel):
    message: str


app = FastAPI()
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
    allow_credentials=True
)
client = OpenAI(api_key=os.getenv("GROQ_KEY"), base_url="https://api.groq.com/openai/v1")



def get_bot_response(message: str) -> str:
    response = client.responses.create(
        input=message,
        model="openai/gpt-oss-20b",
    )
    return response.output_text

@app.post("/chat")
async def chat(request: ChatRequest):
    resp = get_bot_response(request.message)
    return {"message": resp}
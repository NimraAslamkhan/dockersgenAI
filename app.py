# @title Default title text
from fastapi import FastAPI
from transformers import pipeline

#create nea fastAPI app instance
app=FastAPI()

# Use a pipeline as a high-level helper



pipeline=pipeline("text2text-generation", model="google/flan-t5-small")

@app.get("/")
def home():
  return  {"messag":" hellow word"}
  @app.get("/generate")
  def generate(text:str):
    # Initialize the text generation pipeline

    output=pipe(text)

    return  {"output_text":output}[0]['generated_text']
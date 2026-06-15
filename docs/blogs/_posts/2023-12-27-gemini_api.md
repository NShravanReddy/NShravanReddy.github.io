# gemini api

Time: December 27, 2023 11:53 AM
Last edited time: June 15, 2026 2:50 PM

created streamlit a web app using stream lit

create virtual environment

conda create -p venv python==3.10

pip install -r requirements.txt   

streamlit 

google-generativeai
python-dotenv

in .env file keep  GOOGLE_API_KEY=””

```python
from dotenv import load_dotenv

load_dotenv()  # take environment variables from .env.

import streamlit as st
import os
import pathlib
import textwrap

import google.generativeai as genai

from IPython.display import display
from IPython.display import Markdown

def to_markdown(text):
  text = text.replace('•', '  *')
  return Markdown(textwrap.indent(text, '> ', predicate=lambda _: True))

os.getenv("GOOGLE_API_KEY")
genai.configure(api_key=os.getenv("GOOGLE_API_KEY"))

## Function to load OpenAI model and get respones

def get_gemini_response(question):
    model = genai.GenerativeModel('gemini-pro')
    response = model.generate_content(question)
    return response.text

##initialize our streamlit app

st.set_page_config(page_title="Q&A Demo")

st.header("Gemini Application")

input=st.text_input("Input: ",key="input")

submit=st.button("Ask the question")

## If ask button is clicked

if submit:
    
    response=get_gemini_response(input)
    st.subheader("The Response is")
    st.write(response)

---

[Notion](https://app.notion.com/p/nsr6/gemini-api-4f7dbee18f5d4e7a9f443c34c1db921a)




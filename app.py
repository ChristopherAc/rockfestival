from flask import Flask

@app.route("/")
def home():
    return "Hello world"

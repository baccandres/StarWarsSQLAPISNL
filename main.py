from flask import Flask, request
from flask import jsonify
import src.sqltools as sqt

app = Flask(__name__)

@app.route("/")
def inicio():
    return "Hello World"





app.run(debug=True)
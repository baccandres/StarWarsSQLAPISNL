from flask import Flask, request
from flask import jsonify
import tools.sqltools as sqt
import markdown.extensions.fenced_code

app = Flask(__name__)

@app.route("/")
def inicio():
    return "Ciao Mondo!"

@app.route("/characters")
def gimme_characters():
    x = sqt.characters_list()
    return jsonify(x)

@app.route("/quotes/<character>")
def gimme_quotes(character):
    x = sqt.character_quotes(character)
    return jsonify(x)

@app.route("/sentiment/<character>")
def gimme_sentiment(character):
    x = sqt.polarity(character)
    return jsonify(x)

@app.route("/newcharacter", methods=["POST"])
def newCharacter():
    x = request.form.get("Campo")
    return sqt.insertCharacter(x)



if __name__ == '__main__':
    app.run(debug=True)
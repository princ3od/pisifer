from logging import log
import os
from flask import Flask, json, request
from flask_cors import CORS
from inference import load_model, infer
import nltk

nltk.download("punkt")

app = Flask(__name__)
CORS(app)
load_model("d2v.model")


@app.route("/topic-classification", methods=["POST"])
def topic_classification():
    json_data = request.get_json()
    text = json_data["text"]
    top = json_data["top"] if "top" in json_data else 3
    remove_num = json_data["remove_num"] if "remove_num" in json_data else False
    result = infer(text, top, remove_num)
    return json.jsonify(result)


if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=int(os.environ.get("PORT", 5000)))

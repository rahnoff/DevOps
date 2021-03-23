#!/usr/bin/python3

from flask import Flask, request
import emoji

app = Flask(__name__)


@app.route('/', methods=['GET'])
def hello():
    return 'Hello Flask'
    

@app.route('/emoji', methods=['POST'])
def create_emoji():
    delimeter_one = ':'
    delimeter_two = ':'
    request_data = request.get_json()
    emoji_input = request_data['word']
    emoji_input_formatted = delimeter_one + emoji_input + delimeter_two
    emoji_output = emoji.emojize(emoji_input_formatted)
    emoji_count = int(request_data['count'])
    return (emoji_output * emoji_count)

if __name__ == '__main__':
    app.run(port=8080, host='0.0.0.0')
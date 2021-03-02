from flask import Flask, request

app = Flask(__name__)


@app.route('/', methods=['GET'])
def hello():
    return 'Hello Flask'
    

@app.route('/emoji', methods=['POST'])
def create_emoji():
    request_data = request.get_json()
    emoji = request_data['word']
    emoji_count = int(request_data['count'])
    return (emoji * emoji_count)

if __name__ == '__main__':
    app.run(port=80)

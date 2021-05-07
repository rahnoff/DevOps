from flask import Flask

app = Flask(__name__)

@app.route('/', methods=['GET'])
def hello():
    return 'Hello World 3'

if __name__ == '__main__':
    app.run(port=2000, host='0.0.0.0')

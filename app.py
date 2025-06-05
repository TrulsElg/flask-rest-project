from flask import Flask

app = Flask(__name__)

stores = [{"name": "My Store", "items": [{"name": "my item", "price": 15.99}]}]

@app.route('/')
def hello_world():
    return 'Hello World!'

@app.get("/store")
def get_stores():
    return {"stores": stores}


if __name__ == '__main__':
    app.run()

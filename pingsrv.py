from bottle import Bottle

app = Bottle()

@app.route('/')
def ping():
    return "Hello, my name is Ping. Pleasure to meet you."

app.run(server='cherrypy', port=8092, host='0.0.0.0', reloader=True)

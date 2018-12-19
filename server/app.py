from flask import Flask, send_file, render_template
from flask_restful import Resource, Api

from route.compile import Compile

app = Flask(__name__)
api = Api(app)

api.add_resource(Compile, '/compile')

if __name__ == '__main__':
	app.run(debug=True, host='0.0.0.0')

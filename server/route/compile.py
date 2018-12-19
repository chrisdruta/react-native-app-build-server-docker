from flask import send_file
from flask_restful import Resource
import subprocess

class Compile(Resource):
	def get(self):
		command = './scripts/build-app.sh'
		process = subprocess.Popen('/bin/bash', stdin=subprocess.PIPE,
									stderr=subprocess.PIPE, stdout=subprocess.PIPE)

		process.communicate(command.encode('utf-8'))

        #TODO: Error checking from build script

		return send_file(
            './private/private-release.apk',
            attachment_filename='private-release.apk'
        )
        
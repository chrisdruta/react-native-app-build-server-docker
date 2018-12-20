# react-native-app-build-server-docker

Docker container that contains a python server that pulls and builds react-native apps from github and serves built app to android users through an apk download endpoint.

## Disclaimer

This project is a franken-fork from a private repo I thought I needed but didn't. It took a while to put together a working enviornment and this repository is a mimic of the file structure I used.

Due to this, this project contains a lot of unsrouced code from github, dockerhub, and random github gists. Credit to all thoses who I copy-pastad from.

## Requirements

Server running linux with docker installed.

## How to use

1. Update relevent paths in `run-container.sh` (only for local testing)

2. Clone github repo of react-native app code base and make its root folder 'app/' as seen with the example file

3. Run `docker-build.sh`

4. Run `run-container.sh`

#!/bin/bash

cp ./server/requirements.txt .

docker build -t app .

rm requirements.txt

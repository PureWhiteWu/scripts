#!/usr/bin/env bash

git clone https://github.com/adolfintel/speedtest.git ~/speedtest

cd ~/speedtest

git checkout docker

docker build -t adolfintel/speedtest:latest .

docker run -d --name speedtest --restart always -p 0.0.0.0:48888:80 adolfintel/speedtest:latest

docker ps

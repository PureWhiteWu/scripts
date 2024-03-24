#!/usr/bin/env bash

docker run -d --name looking-glass -e HTTP_PORT=48888 --restart always --network host wikihostinc/looking-glass-server

docker ps

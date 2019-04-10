#!/usr/bin/env bash

apt update

apt install -y language-pack-zh-hans

apt install -y vim git

dd if=/dev/zero of=~/test bs=1M count=1000

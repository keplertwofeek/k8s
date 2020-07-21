#!/bin/bash

docker build -t wafeekolatunji/multi-client ./client
docker tag multi-client wafeekolatunji/multi-client
docker build -t wafeekolatunji/multi-nginx ./nginx
docker build -t wafeekolatunji/multi-server ./server
docker build -t wafeekolatunji/multi-worker ./worker
#!/bin/bash

docker run -e CI=true wafeekolatunji/react-test npm run test
./docker-login.sh
./docker-build.sh

# Upload images to docker hub
docker push wafeekolatunji/multi-client
docker push wafeekolatunji/multi-nginx
docker push wafeekolatunji/multi-server
docker push wafeekolatunji/multi-worker
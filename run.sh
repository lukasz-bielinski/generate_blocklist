#!/bin/bash
IMAGE="lukaszbielinski/generate_blocklist"
IMAGE_WEBSERVER="nginx:1.17.9"
IMAGE_BASE="ubuntu:18.04"

bash stop.sh
docker pull $IMAGE_BASE
make build-nc
# uncomment when pushing to registry is required
# make publish-latest

docker run -d \
  --name generate_blocklist \
  --net=host \
  -v $(pwd)/webserver-files:/webserver-files \
   $IMAGE

docker run -d \
   --name nginx \
   -p 7777:80 \
   -v $(pwd)/webserver-files:/usr/share/nginx/html \
    $IMAGE_WEBSERVER

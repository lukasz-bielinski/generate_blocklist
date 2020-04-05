#!/bin/bash
bash stop.sh

make build
make publish-latest

IMAGE="lukaszbielinski/generate_blocklist"
IMAGE_WEBSERVER="nginx:1.17.9"

docker run -d \
  --name generate_blocklist \
  --net=host \
  -v $(pwd)/webserver-files:/webserver-files \
   $IMAGE

docker run -d \
   --name nginx \
   --net=host \
   -v $(pwd)/webserver-files:/usr/share/nginx/html:ro \
    $IMAGE_WEBSERVER

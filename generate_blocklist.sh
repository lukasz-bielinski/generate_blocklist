#!/bin/bash

while true; do
curl -s https://www.iblocklist.com/lists.json | \
    jq -r '.lists[] | select(.subscription == "false") | .list' | \
    awk '{ print "http://list.iblocklist.com/?fileformat=p2p&archiveformat=gz&list=" $0 }' | \
    xargs wget -O - | \
    gunzip | \
    egrep -v '^#' | \
    gzip > webserver-files/blocklist.gz

echo "sleep for 1800s"
    sleep 1800

done

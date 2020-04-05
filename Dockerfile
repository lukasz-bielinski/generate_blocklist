FROM ubuntu:18.04

RUN apt update -y && \
    apt upgrade -y && \
    apt install -y curl jq gawk wget unzip grep gzip
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

ADD generate_blocklist.sh generate_blocklist.sh
RUN chmod +x generate_blocklist.sh

CMD /generate_blocklist.sh

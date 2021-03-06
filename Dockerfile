FROM debian:10.10-slim

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install --no-install-recommends -y python3-pip && \
    pip3 install flake8 flake8-html anybadge && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

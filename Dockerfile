FROM debian:10.10-slim

RUN apt update && \
    apt install -y python3-pip && \
    pip3 install flake8 anybadge

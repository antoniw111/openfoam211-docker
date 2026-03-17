FROM ubuntu:12.04

RUN sed -i 's/http:\/\/archive.ubuntu.com/http:\/\/old-releases.ubuntu.com/' /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y wget \
    && wget -O - http://dl.openfoam.org/gpg.key | apt-key add - \
    && echo deb http://dl.openfoam.org/ubuntu precise main > /etc/apt/sources.list.d/openfoam.list \
    && apt-get update \
    && apt-get install -y openfoam211 \
    && rm -rf /var/lib/apt/lists/*
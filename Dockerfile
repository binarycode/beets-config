FROM debian:stretch
MAINTAINER Igor Sidorov <igor.sidorov@binarycode.ru>

RUN apt-get update && \
    apt-get install --no-install-recommends -y \
      python-dev \
      python-pip \
      python-setuptools \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir -U \
      beets \
      pylast \
      requests

VOLUME /beets
VOLUME /db
VOLUME /from
VOLUME /to

WORKDIR /beets

#FROM debian:wheezy
FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
  python-dev=2.7.5-5ubuntu3 \
  curl \
  && apt-get clean

RUN curl https://bootstrap.pypa.io/get-pip.py | python
RUN pip install -U pip

ADD . /pingsrv

WORKDIR /pingsrv
RUN pip install -r requirements.txt

CMD ["/usr/bin/python", "pingsrv.py"]

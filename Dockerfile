# build as fredhutch/bwa:0.7.17
FROM ubuntu:18.04

RUN apt-get update -y 
RUN apt-get install -y build-essential curl zlib1g-dev

WORKDIR /

RUN curl -LO https://github.com/lh3/bwa/archive/v0.7.17.tar.gz


RUN tar zxf v0.7.17.tar.gz

WORKDIR /bwa-0.7.17

RUN make && cp ./bwa /usr/local/bin

WORKDIR /

RUN rm -rf v0.7.17.tar.gz bwa-0.7.17




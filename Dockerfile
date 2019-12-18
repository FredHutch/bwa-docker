# build as fredhutch/bwa:0.7.17
FROM ubuntu:18.04

RUN apt-get update -y 
RUN apt-get install -y build-essential curl zlib1g-dev autoconf automake libncurses5-dev libbz2-dev liblzma-dev libssl-dev libcurl4-gnutls-dev python3-pip

RUN pip3 install awscli

WORKDIR /

RUN curl -LO https://github.com/lh3/bwa/archive/v0.7.17.tar.gz


RUN tar zxf v0.7.17.tar.gz

WORKDIR /bwa-0.7.17

RUN make && cp ./bwa /usr/local/bin

WORKDIR /

RUN rm -rf v0.7.17.tar.gz bwa-0.7.17


RUN curl -LO https://github.com/samtools/samtools/releases/download/1.9/samtools-1.9.tar.bz2

RUN tar jxf samtools-1.9.tar.bz2

WORKDIR /samtools-1.9

RUN autoheader && autoconf -Wno-syntax && ./configure && make && make install

WORKDIR /

RUN rm -rf samtools-1.9 samtools-1.9.tar.bz2





FROM ubuntu:14.04


COPY boost_1_57_0.tar.bz2 /opt/boost_1_57_0.tar.bz2

RUN apt-get -y update && apt-get install -yfV gcc-4.9 cmake make libbz2-dev libdb++-dev libdb-dev libssl-dev openssl libreadline-dev

ENV BOOST_ROOT /opt/boost_1_57_0
RUN apt-get -y update && apt-get install -yfV autotools-dev build-essential g++ libbz2-dev libicu-dev python-dev

RUN cd /opt && tar xjf boost_1_57_0.tar.bz2 && cd boost_1_57_0 && ./bootstrap.sh "--prefix=$BOOST_ROOT" && ./b2 install

RUN apt-get -y update && apt-get install -yfV autoconf
RUN apt-get -y update && apt-get install -yfV git libreadline-dev uuid-dev g++ libdb++-dev libdb-dev zip
RUN apt-get -y update && apt-get install -yfV libssl-dev openssl build-essential python-dev autotools-dev libicu-dev build-essential
RUN apt-get -y update && apt-get install -yfV libbz2-dev automake doxygen cmake ncurses-dev libtool nodejs nodejs-legacy npm mc

COPY brc_mainnet /opt/brc_mainnet

RUN cd /opt/brc_mainnet && mkdir /opt/brc_mainnet/build && cd /opt/brc_mainnet/build && cmake .. && make



FROM ruby:2.6.5

ENV MAKEJOBS -j3
ENV LC_ALL C.UTF-8
ENV PACKAGES "git build-essential nodejs libleveldb-dev"

USER root
WORKDIR /root/src

RUN apt-get update \
  && apt-get install --no-install-recommends --no-upgrade -qq $PACKAGES
RUN git clone --depth 1 https://github.com/chaintope/bitcoinrb.git /root/src

RUN cd /root/src \
  && bundle install


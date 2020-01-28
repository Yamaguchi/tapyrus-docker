FROM rust:1.34.0

ENV PACKAGES "clang cmake libsnappy-dev git"

RUN apt-get update \
  && apt-get install -y $PACKAGES

USER root
WORKDIR /root/src

RUN git clone --depth 1 https://github.com/chaintope/electrs-tapyrus.git -b v0.1.0 /root/src

RUN cd /root/src \
  && cargo build --release \
  && cargo install --path .

# Electrum RPC
EXPOSE 50001

# Prometheus monitoring
EXPOSE 4224

STOPSIGNAL SIGINT

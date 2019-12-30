FROM ubuntu:18.04

ENV MAKEJOBS -j3
ENV LC_ALL C.UTF-8
ENV BUILD_PACKAGES "build-essential libtool autotools-dev automake pkg-config bsdmainutils curl git ca-certificates ccache"
ENV PACKAGES "python3-zmq libssl1.0-dev libevent-dev bsdmainutils libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-test-dev libboost-thread-dev libdb5.3++-dev libminiupnpc-dev libzmq3-dev libprotobuf-dev protobuf-compiler libqrencode-dev"
ENV BITCOIN_CONFIG "--enable-zmq --with-incompatible-bdb --enable-glibc-back-compat --enable-reduce-exports --with-gui=no CPPFLAGS=-DDEBUG_LOCKORDER  --disable-wallet"

USER root
WORKDIR /root

RUN apt-get update \
  && apt-get install --no-install-recommends --no-upgrade -qq $PACKAGES $BUILD_PACKAGES

RUN git clone --depth 1 https://github.com/chaintope/tapyrus-core.git -b v0.3.0 /root/src

RUN cd /root/src \
  && ./autogen.sh \
  && ./configure --disable-dependency-tracking $BITCOIN_CONFIG \
  && make $MAKEJOBS install \
  && make install

ENV datadir /var/lib/tapyrus
ENV conf $datadir/tapyrus.conf

RUN mkdir $datadir

# mainet p2p port
EXPOSE 2357
# testnet p2p port
EXPOSE 12357
# regtest p2p port
EXPOSE 12383
# mainnet rpc port
EXPOSE 2377
# testnet rpc port
EXPOSE 12377
# regtest rpc port
EXPOSE 12381

VOLUME ["$datadir"]

ENTRYPOINT tapyrusd -datadir=$datadir -conf=$conf
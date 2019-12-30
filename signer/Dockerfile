FROM rust:latest

ENV PACKAGES "clang cmake git"

RUN apt-get update \
  && apt-get install -y $PACKAGES


USER root
WORKDIR /root/src

RUN git clone --depth 1 https://github.com/chaintope/tapyrus-signer.git /root/src

RUN cd /root/src \
  && cargo build --release \
  && cargo install --path .

ENV ENTRYKIT_VERSION 0.4.0
RUN wget https://github.com/progrium/entrykit/releases/download/v${ENTRYKIT_VERSION}/entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz \
  && tar -xvzf entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz \
  && rm entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz \
  && mv entrykit /bin/entrykit \
  && chmod +x /bin/entrykit \
  && entrykit --symlink

# Dockerize [https://github.com/jwilder/dockerize]
ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
  && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
  && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz


STOPSIGNAL SIGINT

ENTRYPOINT [ \
  "prehook", \
  "--" \
  ]

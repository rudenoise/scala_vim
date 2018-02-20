FROM alpine:latest as builder

MAINTAINER rudenoise <rudenoise@gmail.com>

WORKDIR /tmp

# Install dependencies
RUN apk add --no-cache \
    build-base \
    ctags \
    git \
    libx11-dev \
    libxpm-dev \
    libxt-dev \
    make \
    ncurses-dev \
    python \
    python-dev

# Build vim from git source
RUN git clone https://github.com/vim/vim \
 && cd vim \
 && ./configure \
    --disable-gui \
    --disable-netbeans \
    --enable-multibyte \
    --enable-pythoninterp \
    --with-features=big \
    --with-python-config-dir=/usr/lib/python2.7/config \
 && make install

# Pull base image
FROM rudenoise/jdk-sbt


COPY --from=builder /usr/local/bin/ /usr/local/bin
COPY --from=builder /usr/local/share/vim/ /usr/local/share/vim/
COPY ./vim.bash /root/

RUN apk add --update --no-cache \
        libice \
        libsm \
        libx11 \
        libxt \
        ncurses \
        git \
        bash \
        curl \
        wget \
        bind-tools \
        tree \
        gcc \
        musl-dev \
        python2-dev \
        python2 && \
    python2 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip2 install --upgrade pip setuptools websocket-client sexpdata && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip2 /usr/bin/pip ; fi && \
    if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python2 /usr/bin/python; fi && \
    rm -r /root/.cache &&\
    ./vim.bash


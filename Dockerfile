FROM ubuntu:16.04

RUN \
  apt-get update && \
  apt-get install -y nano build-essential dnsutils pkg-config libcurl4-gnutls-dev libc6-dev libevent-dev m4 g++-multilib autoconf libtool libncurses5-dev unzip git python zlib1g-dev wget bsdmainutils automake libboost-all-dev libssl-dev libprotobuf-dev protobuf-compiler libqt4-dev libqrencode-dev libdb++-dev ntp ntpdate && \
  cd ~ && git clone https://github.com/jl777/komodo && \
  cd komodo && \
  ./zcutil/fetch-params.sh && \
  ./zcutil/build.sh -j$(nproc) && \
  mkdir ~/.komodo

ADD komodo.conf /root/.komodo/komodo.conf

WORKDIR /root/komodo

ENTRYPOINT \
  echo "Launching komodod daemon in background >> komodod.log" && \
  nohup ./src/komodod -daemon > komodod.log 2>&1 & \
  /bin/bash
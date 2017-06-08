FROM ubuntu:16.04

RUN \
  # install Komodo based on https://github.com/jl777/komodo documentation
  apt-get update && \
  apt-get install -y nano build-essential dnsutils pkg-config libcurl4-gnutls-dev libc6-dev libevent-dev m4 g++-multilib autoconf libtool libncurses5-dev unzip git python zlib1g-dev wget bsdmainutils automake libboost-all-dev libssl-dev libprotobuf-dev protobuf-compiler libqt4-dev libqrencode-dev libdb++-dev ntp ntpdate && \
  cd ~ && git clone https://github.com/jl777/komodo && \
  cd komodo && \
  ./zcutil/fetch-params.sh && \
  ./zcutil/build.sh -j$(nproc)

ADD komodo.conf /root/komodo.conf.default

# P2P:7770 | RPC:7771
EXPOSE 7770 7771

VOLUME /root/.komodo

WORKDIR /root/komodo

CMD \
  # restore the .komodo folder if the volume is empty
  [ $(ls ~/.komodo | wc -l) -ne 0 ] && \
  echo "> ~/.komodo not empty: using existing data" || \
  echo "> ~/.komodo is empty: using default conf" && \
  mv /root/komodo.conf.default ~/.komodo/komodo.conf && \
  # run komodo daemon
  echo "> Running Komodo daemon in background >> komodod.log" && \
  nohup ./src/komodod -daemon > komodod.log 2>&1 & \
  # bash shell
  /bin/bash

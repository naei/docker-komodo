FROM ubuntu:18.04

RUN \
  apt-get update && \
  apt-get install -y wget curl nano libtool && \
  # install the latest Linux release from official Github repository
  curl -s https://api.github.com/repos/KomodoPlatform/komodo/releases/latest | grep browser_download_url | grep komodo_linux | cut -d '"' -f 4 | wget -O komodo_linux.tar.gz -qi - && \
  mkdir -p /root/komodo && tar -xzf ./komodo_linux.tar.gz -C /root/komodo --strip-components 1 && \
  cd /root/komodo && \
  ./fetch-params.sh

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
  mv ~/komodo.conf.default ~/.komodo/komodo.conf && \
  # run komodo daemon
  echo "> Running Komodo daemon in background >> komodod.log" && \
  nohup ./komodod -daemon > komodod.log 2>&1 & \
  # bash shell
  /bin/bash
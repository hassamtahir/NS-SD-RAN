FROM ubuntu:18.04

WORKDIR /home/app

RUN apt update \
  && apt install -y gpg wget \
  && wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | gpg --dearmor - | tee /usr/share/keyrings/kitware-archive-keyring.gpg >/dev/null \
  && echo 'deb [signed-by=/usr/share/keyrings/kitware-archive-keyring.gpg] https://apt.kitware.com/ubuntu/ bionic main' | tee /etc/apt/sources.list.d/kitware.list >/dev/null \
  && apt update && apt install -y build-essential git cmake libsctp-dev \
    autoconf automake libtool bison flex libboost-all-dev \
    g++ python3 vim

RUN git clone -b develop https://github.com/dhanifudin/ns-o-ran-e2-sim oran-e2sim \
  && cd oran-e2sim/e2sim \
  && mkdir build \
  && cd build \
  && cmake .. -DDEV_PKG=1 -DLOG_LEVEL=3\
  && make package \
  && dpkg --install ./e2sim-dev_1.0.0_amd64.deb \
  && ldconfig

RUN git clone -b sd-ran https://github.com/dhanifudin/ns-o-ran-ns3-mmwave ns-sd-ran \
  && cd ns-sd-ran/contrib \
  && git clone -b master https://github.com/dhanifudin/sim-ns3-o-ran-e2 oran-interface \
  && cd .. \
  && ./waf configure --enable-examples --enable-tests \
  && ./waf build

WORKDIR /home/app/ns-sd-ran

CMD ["tail", "-f", "/dev/null"]

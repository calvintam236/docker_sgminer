FROM calvintam236/ubuntu.amdgpu-pro

MAINTAINER calvintam236 <calvintam236@users.noreply.github.com>
LABEL description="sgminer in Docker. Supports GPU mining."

WORKDIR /tmp

RUN apt-get update \
    && apt-get -y --no-install-recommends install lsb-release bzip2 ca-certificates curl git libcurl4-openssl-dev pkg-config libtool libncurses5-dev autoconf automake \
    && curl -L -O https://phoenixnap.dl.sourceforge.net/project/nicehashsgminerv5viptools/APP%20SDK%20A%20Complete%20Development%20Platform/AMD%20APP%20SDK%203.0%20for%2064-bit%20Linux/AMD-APP-SDKInstaller-v3.0.130.136-GA-linux64.tar.bz2 \
    && tar -jxvf AMD-APP-SDKInstaller-v3.0.130.136-GA-linux64.tar.bz2 \
    && rm AMD-APP-SDKInstaller-v3.0.130.136-GA-linux64.tar.bz2 \
    && ./AMD-APP-SDK-v3.0.130.136-GA-linux64.sh -- --acceptEULA 'yes' -s \
    && rm AMD-APP-SDK-v3.0.130.136-GA-linux64.sh \
    && rm -r /root/AMDAPPSDK-3.0/ \
    && git clone https://github.com/tpruvot/sgminer.git \
    && cd sgminer/ \
    && git submodule init \
    && git submodule update \
    && autoreconf -fi \
    && CFLAGS="-Os -Wall -I/opt/AMDAPPSDK-3.0/include -L/opt/amdgpu-pro/lib/x86_64-linux-gnu" ./configure --disable-adl \
    && make \
    && make install \
    && cd .. \
    && rm -r sgminer/ \
    && apt-get -y remove lsb-release bzip2 ca-certificates curl git pkg-config libtool libncurses5-dev autoconf automake \
    && apt-get -y autoremove \
    && apt-get clean autoclean \
    && rm -rf /var/lib/{apt,dpkg,cache,log}/

ENTRYPOINT ["sgminer"]

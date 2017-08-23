FROM calvintam236/ubuntu:amdgpu-pro

MAINTAINER calvintam236 <calvintam236@users.noreply.github.com>
LABEL description="sgminer in Docker. Supports GPU mining."

WORKDIR /tmp

RUN apt-get update \
    && apt-get -y --no-install-recommends install ca-certificates curl \
    && curl -L -O https://github.com/genesismining/sgminer-gm/releases/download/5.5.5/sgminer_ubuntu64 \
    && mv sgminer_ubuntu64 /usr/local/bin/sgminer \
    && chmod a+x /usr/local/bin/sgminer \
    && apt-get -y remove ca-certificates curl \
    && apt-get -y autoremove \
    && apt-get clean autoclean \
    && rm -rf /var/lib/{apt,dpkg,cache,log}

ENTRYPOINT ["sgminer"]

FROM ubuntu:14.04
MAINTAINER Andrew Mackrodt <andrew.mackrodt@pay4later.com>

# install package dependencies
RUN apt-get -q -y update && \
    apt-get -q -y install wget libfontconfig1 libfreetype6 libglib2.0.0 libice6 libsm6 libssl0.9.8 libx11-6 libxext6 libxrender1 uuid-runtime && \
    apt-get clean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/* /var/cache/*

# install comodo
RUN wget -q http://download.comodo.com/cavmgl/download/installs/1000/standalone/cav-linux_1.1.268025-1_amd64.deb && \
    DEBIAN_FRONTEND=noninteractive dpkg -i cav-linux_1.1.268025-1_amd64.deb && \
    apt-get -q -y install -f && \
    DEBIAN_FRONTEND=noninteractive /opt/COMODO/post_setup.sh && \
    rm -f cav-linux_1.1.268025-1_amd64.deb

ENTRYPOINT ["/opt/COMODO/cmdscan"]

CMD ["-h"]
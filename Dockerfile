FROM debian:jessie

MAINTAINER opsxcq <opsxcq@thestorm.com.br>

RUN apt-get update && \
    apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    build-essential \
    gcc-avr \
    avr-libc \
    avrdude \
    arduino-core && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


VOLUME /data
WORKDIR /data

COPY main.sh /

ENTRYPOINT ["/main.sh"]
CMD ["default"]


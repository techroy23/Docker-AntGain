FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y \
         curl wget btop bash procps \
         ca-certificates dos2unix iptables redsocks libc6  \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://raw.githubusercontent.com/proxy-peer/antgain-installer/main/install-cli.sh | bash

HEALTHCHECK --interval=30s --timeout=3s --retries=5 CMD pgrep -f antgain || exit 1

ENTRYPOINT ["antgain", "--api-key"]

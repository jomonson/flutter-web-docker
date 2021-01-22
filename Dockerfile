FROM debian:stable

ENV FLUTTER_VERSION="1.22.5"
ENV FLUTTER_URL="https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_$FLUTTER_VERSION-stable.tar.xz"
ENV FLUTTER_NAME="flutter.tar.xz"

RUN apt update

RUN apt-get install -yq wget xz-utils curl git unzip

WORKDIR /development
RUN curl -o $FLUTTER_NAME $FLUTTER_URL
RUN tar xf $FLUTTER_NAME
ENV PATH "$PATH:/development/flutter/bin"
RUN flutter doctor

# enable web
RUN flutter channel beta
RUN flutter upgrade
RUN flutter config --enable-web

ENTRYPOINT ["/bin/bash"]
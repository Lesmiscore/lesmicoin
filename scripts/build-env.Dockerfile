# Lesmicoin cross-complation environment
FROM ubuntu

# Install apt-fast
RUN apt-get update -qq -y && \
  apt-get install -y wget aria2 && \
  wget -O /bin/apt-fast https://github.com/ilikenwf/apt-fast/raw/master/apt-fast && \
  chmod +x /bin/apt-fast

# Install minimum requirements for compilation
RUN apt-fast upgrade -y -qq && \
    apt-fast install -y -qq \
      build-essential pkg-config \
      libtool autotools-dev autoconf \
      tar zip unzip git curl python python3

# Install following HOSTs for cross-compile
# i686-linux-gnu
# x86_64-linux-gnu
# i686-w64-mingw32
# x86_64-w64-mingw32
# aarch64-linux-gnu
# arm-linux-gnueabi
# arm-linux-gnueabihf
RUN apt-fast install -y \
      gcc-i686-linux-gnu        g++-i686-linux-gnu \
      gcc-mingw-w64-i686        g++-mingw-w64-i686 \
      gcc-mingw-w64-x86-64      g++-mingw-w64-x86-64 \
      gcc-x86-64-linux-gnux32   g++-x86-64-linux-gnux32 \
      gcc-aarch64-linux-gnu     g++-aarch64-linux-gnu \
      gcc-arm-linux-gnueabi     g++-arm-linux-gnueabi \
      gcc-arm-linux-gnueabihf   g++-arm-linux-gnueabihf

RUN type gcc g++ \
    i686-linux-gnu-gcc i686-linux-gnu-g++ \
    x86_64-linux-gnu-gcc x86_64-linux-gnu-g++ \
    i686-w64-mingw32-gcc i686-w64-mingw32-g++ \
    x86_64-w64-mingw32-gcc x86_64-w64-mingw32-g++ \
    aarch64-linux-gnu-gcc aarch64-linux-gnu-g++ \
    arm-linux-gnueabi-gcc arm-linux-gnueabi-g++ \
    arm-linux-gnueabihf-gcc arm-linux-gnueabihf-g++

# Change to posix as requested here: https://github.com/nao20010128nao/lesmicoin/blob/master/doc/build-windows.md
RUN update-alternatives --set x86_64-w64-mingw32-gcc /usr/bin/x86_64-w64-mingw32-gcc-posix && \
    update-alternatives --set x86_64-w64-mingw32-g++ /usr/bin/x86_64-w64-mingw32-g++-posix


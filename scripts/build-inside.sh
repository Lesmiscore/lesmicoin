#!/bin/bash
set -e
cd /tmp
git clone /tmp/repo/.git lesmicoin
cd lesmicoin
git checkout "$BRANCH"

cd depends
make HOST="$HOST"
cd ../
./autogen.sh
./configure C{,XX}FLAGS='-O3' \
    CONFIG_SITE=$PWD/depends/"$HOST"/share/config.site \
    --with-boost-libdir=$PWD/depends/"$HOST"/lib \
    --prefix=$PWD/root \
    --disable-{tests,bench} \
    --enable-qt=auto
make -j2
make install

if [[ "$HOST" == *"mingw"* ]]; then
  # ZIP for Windows
  "$HOST"-strip root/bin/*.exe
  zip -9r /tmp/artifacts/lesmicoin-"$HOST".zip root/
else
  # TAR.xz for Linux
  "$HOST"-strip root/bin/*
  tar cJvf /tmp/artifacts/lesmicoin-"$HOST".tar.xz root/
fi
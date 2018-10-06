#!/bin/bash
export NAME="$(pwgen 10 1)"
export HOST="$1"
export BRANCH="${2:-$(git rev-parse HEAD)}"
cd "$(git rev-parse --show-toplevel)"

docker run --rm -i --name $NAME -e HOST="$HOST" -e BRANCH="$BRANCH" -v "$PWD/":/tmp/repo -v "$PWD/artifacts":/tmp/artifacts -v "$PWD/scripts":/tmp/scripts nao20010128nao/lesmicoin:build-env /tmp/scripts/build-inside.sh

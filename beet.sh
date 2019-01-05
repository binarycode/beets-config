#!/usr/bin/env bash

docker run \
  --interactive \
  --tty \
  --rm \
  --volume "$(pwd):/beets" \
  --volume "$DB:/db" \
  beets \
  beet $1

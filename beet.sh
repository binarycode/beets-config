#!/usr/bin/env bash

docker run \
  --rm \
  -v $(pwd):/beets \
  -v $DB:/db \
  beets \
  beet $1

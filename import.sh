#!/usr/bin/env bash

DB=
FROM=
TO=

while true; do
  case "$1" in
    --db )
      DB=$2
      shift
      shift
      ;;

    --from )
      FROM=$2
      shift
      shift
      ;;

    --to )
      TO=$2
      shift
      shift
      ;;

    -h | --help )
      echo "Usage: ./import.sh --db DB --from FROM --to TO"
      echo " --db"
      echo "   path to beets DB file"
      echo
      echo " --from"
      echo "   path to the music to be imported"
      echo "   NOTE: music will be moved from this path"
      echo
      echo " --to"
      echo "   path to music archive"
      exit 0
      ;;

    * )
      break
      ;;
  esac
done

if [ ! -e "$DB" ]
then
  echo "DB does not exist"
  exit 1
fi

if [ ! -e "$FROM" ]
then
  echo "FROM does not exist"
  exit 1
fi

if [ ! -d "$TO" ]
then
  echo "TO is not a directory"
  exit 1
fi

docker run \
  --interactive \
  --tty \
  --rm \
  --volume "$(pwd):/beets" \
  --volume "$DB:/db" \
  --volume "$FROM:/from" \
  --volume "$TO:/to" \
  beets \
  beet -c /beets/config.yaml import /from

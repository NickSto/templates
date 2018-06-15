#!/usr/bin/env bash
if [ "x$BASH" = x ] || [ ! "$BASH_VERSINFO" ] || [ "$BASH_VERSINFO" -lt 4 ]; then
  echo "Error: Must use bash version 4+." >&2
  exit 1
fi
set -ue

Usage="Usage: \$ $(basename "$0") [options] required [pos2]"

function main {

  # Get arguments.
  flag=
  num=0
  while getopts "fn:h" opt; do
    case "$opt" in
      f) flag="true";;
      n) num="$OPTARG";;
      [h?]) fail "$Usage";;
    esac
  done
  required="${@:$OPTIND:1}"
  pos2="${@:$OPTIND+1:1}"

  if ! [[ "$required" ]]; then
    fail "$Usage"
  fi
}

function fail {
  echo "$@" >&2
  exit 1
}

main "$@"

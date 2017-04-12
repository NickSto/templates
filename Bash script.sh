#!/usr/bin/env bash
if [ x$BASH = x ] || [ ! $BASH_VERSINFO ] || [ $BASH_VERSINFO -lt 4 ]; then
  echo "Error: Must use bash version 4+." >&2
  exit 1
fi
set -ue

Usage="Usage: \$ $(basename $0)"

function main {
  if [[ $# -lt 1 ]] || [[ $1 == '-h' ]] || [[ $1 == '--help' ]]; then
    fail "$Usage"
  fi
}

function fail {
  echo "$@" >&2
  exit 1
}

main "$@"

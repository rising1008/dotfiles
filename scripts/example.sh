#!/usr/bin/env bash

set -e

version() {
  echo "0.1.0"
}

usage() {
  version
  # echo "Usage: bats [-c] [-p | -t] <test> [<test> ...]"
}

usage

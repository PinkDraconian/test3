#!/bin/bash
set -eu

tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT

git -C "$tmp" init -q
git -C "$tmp" fetch --depth=1 -q \
  http://git@192.168.0.1:8080/PinkDraconian/test2 \
  main

echo "Private repository marker:"
git -C "$tmp" show FETCH_HEAD:test

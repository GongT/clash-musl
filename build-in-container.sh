#!/usr/bin/env bash

set -Eeuo pipefail

podman pull docker.io/alpine:latest

NAME="gongt-build-clash"

set -x

podman rm -f --ignore "$NAME"

mkdir -p "$SYSTEM_COMMON_CACHE/apk" "$SYSTEM_COMMON_CACHE/golang"

podman run "--name=$NAME" \
	"--volume=$SYSTEM_COMMON_CACHE/apk:/etc/apk/cache" \
	"--volume=$SYSTEM_COMMON_CACHE/golang:/go/cache" \
	"--volume=$(pwd)/clash:/src" \
	alpine sh <build-script.sh

cd clash/bin

wget https://github.com/Dreamacro/maxmind-geoip/releases/latest/download/Country.mmdb
mv clash-linux-amd64 clash
tar czf clash-musl.tar.gz ./*

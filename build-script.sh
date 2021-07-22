#!/usr/bin/env bash

set -Eeuo pipefail

export GO111MODULE="auto"
export GOCACHE="/go/cache/golang"
export GOMODCACHE="/go/cache/golang.mod"
export GOPATH=/go
export GOPROXY="https://proxy.golang.org"
export PATH="$GOPATH/bin:$PATH"

mkdir -p "$GOCACHE" "$GOMODCACHE"

cd /src

set -x

make linux-amd64
gzip clash/bin/clash-linux-amd64

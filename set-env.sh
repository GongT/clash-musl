#!/usr/bin/env bash

set -Eeuo pipefail

export SYSTEM_COMMON_CACHE="$HOME/cache/"
echo "SYSTEM_COMMON_CACHE=${SYSTEM_COMMON_CACHE}" >>"$GITHUB_ENV"
mkdir -p "$SYSTEM_COMMON_CACHE"

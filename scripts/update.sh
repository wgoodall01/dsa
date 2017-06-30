#!/usr/bin/env bash

export ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../" && pwd )"
source "$ROOT/scripts/config.sh"

cd $ROOT
git submodule update --init

#!/bin/bash

export WORK_DIR="./src"
export SENSITIVE_FILE="${WORK_DIR}/sensitive-file"
export BRANCH_NAME="add-sensitive-data"
export REPO="$(git config --get remote.origin.url | sed -e 's|git@|https://|' -e 's|github.com:|github.com/|')"
export ROOT_DIR="$(git rev-parse --show-toplevel)"

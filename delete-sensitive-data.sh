#!/bin/bash

source ./source.sh

cd ${WORK_DIR}
_sensitive_file="$(basename ${SENSITIVE_FILE})"
bfg --delete-files ${_sensitive_file} --no-blob-protection ${ROOT_DIR}
git reset ${_sensitive_file}
git commit --allow-empty -m "Deleted sensitive file"
git push origin ${BRANCH_NAME} --force

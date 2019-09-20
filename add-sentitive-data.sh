#!/bin/bash

source ./source.sh

mkdir -p ${WORK_DIR}

git checkout -b "${BRANCH_NAME}"

echo "This is sensitive data" > ${SENSITIVE_FILE}
git add ${SENSITIVE_FILE}
git commit -m "Add sensitive file"
git push origin ${BRANCH_NAME}

open "${REPO}/commit/$(git rev-parse HEAD)"

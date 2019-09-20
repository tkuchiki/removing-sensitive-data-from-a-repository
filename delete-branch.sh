#!/bin/bash

source ./source.sh

git push origin :${BRANCH_NAME}
git checkout master
git branch -D ${BRANCH_NAME}

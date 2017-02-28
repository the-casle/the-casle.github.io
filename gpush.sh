#!/bin/bash
./update.sh
git add --all
git commit -m "$*"
git push

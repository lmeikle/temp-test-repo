#!/usr/bin/env bash

git update-index -q --refresh
if ! git diff-index --quiet HEAD --; then
  echo "Working directory not clean, please commit your changes first"
  exit
fi

npm --no-git-tag-version version patch

CURRENT_VERSION=$(npm run version --silent)

git add .
git commit -m "Publish " + $CURRENT_VERSION
git push

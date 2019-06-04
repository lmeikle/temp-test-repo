#!/usr/bin/env bash

git update-index -q --refresh
if ! git diff-index --quiet HEAD --; then
  echo "Working directory not clean, please commit your changes first"
  exit
fi

cd library
npm --no-git-tag-version version patch -m \"Publish %s\"
cd ..

git add .
git commit -m "xxxx"
git push
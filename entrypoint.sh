#!/bin/sh -l

VERSION=$1
NPM_TOKEN=$2
TAG=$3

mkdir /workspace/proto
cp -R ./proto/* /workspace/proto
cp -R ./third_party/proto/* /workspace/proto
cd /workspace || exit

npm version "$VERSION"
yarn codegen
yarn buidl
export NPM_TOKEN="$NPM_TOKEN"

if [ "$TAG" = "" ]; then
  npm publish
else
  npm publish --tag "$TAG"
fi

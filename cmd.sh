#!/bin/bash

REPO="giuliocalzo/docker-rclone"
VERSION=${2:-latest}



if [[ $1 == "build" ]]; then
  docker build -t ${REPO}:${VERSION} .

elif [[ $1 == "push" ]]; then
  docker push ${REPO}

elif [[ $1 == "run" ]]; then
  docker run  -i -t ${REPO}:${VERSION}

elif [[ $1 == "tag" ]]; then
  ls ./ 

else
  echo "MISSING Action: ./cmd.sh build | push | tag | run"
fi

if [[ "$VERSION" != "latest" ]]; then
  git commit -am "bump verion $VERSION"
  git push origin
  git tag $VERSION
  git add -A *  
  git push origin --tags
fi
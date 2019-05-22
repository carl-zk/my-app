#!/bin/bash
set -e -x -u
SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
echo $SCRIPT_DIR

pushd ${SCRIPT_DIR}
cd ..

yarn build 

rm -rf docker/web && mkdir -p docker/web && mv build/* docker/web/
cd docker

export IMAGE_NAME="zxfspace/my-web"
docker build --rm -t ${IMAGE_NAME} .
docker push ${IMAGE_NAME}

docker run -it --rm --name "my-web" \
  -p 8080:80 ${IMAGE_NAME}

popd




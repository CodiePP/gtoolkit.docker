#!/bin/sh

IMAGE=gtoolkit
XAUTH=$(pwd)/Xauthority

rm -f ${XAUTH}
xauth extract ${XAUTH} $DISPLAY
#setfacl -m user:1000:r ${XAUTH}

docker build -t ${IMAGE} .

docker run -it --rm \
  --name ${IMAGE} \
  --gpus all \
  --net=host \
  -e DISPLAY \
  -v ${XAUTH}:/root/.Xauthority \
  -v $(pwd)/image/GlamorousToolkit.changes:/app/GlamorousToolkit.changes \
  -v $(pwd)/image/GlamorousToolkit.image:/app/GlamorousToolkit.image \
  ${IMAGE} $@


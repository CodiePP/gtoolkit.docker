FROM nvidia/cuda:11.2.2-base
CMD nvidia-smi

RUN apt-get update && apt-get install --no-install-recommends --no-install-suggests -y curl
RUN apt-get -y install rsync
RUN apt-get -y install x11-apps x11-utils x11-xserver-utils libxrandr2 libxi6 libxinerama1 libxmu6 libxext6 libice6
RUN apt-get -y install libnvidia-gl-460-server libnvidia-common-460-server

COPY GlamorousToolkitLinux64-v0.8.750/ /app/ 
WORKDIR /app

CMD bash

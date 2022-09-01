FROM nvidia/cuda:11.2.1-cudnn8-devel-ubuntu20.04

RUN apt-get -yqq update

RUN DEBIAN_FRONTEND=noninteractive TZ=Asia/Singapore apt-get -y install tzdata

RUN apt-get install -yqq sudo openssh-server vim git tmux && apt-get clean

ENV TZ="Asia/Singapore"

CMD ["/bin/sh", "-c", "service ssh start && tail -f /dev/null"]

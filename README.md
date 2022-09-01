## Install docker and nvidia-cuda-toolkit

## Build image
`docker pull nvidia/cuda:11.2.1-cudnn8-devel-ubuntu20.04`
`docker build -t ckj_image .`


## Create a new container
`sudo ./create_containers.sh`
`docker exec -it container_name /bin/bash`


## Add a user for the container
> inside the container
`cd /home/user_name/`
`sudo bash add_user.sh`
`mv bashrc /home/user_name/.bashrc`
`exit`


> test for the create user with the specific port
`ssh user_name@ip -p port`
`./Miniconda.sh`
`exit`

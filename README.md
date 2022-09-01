## Install docker and [nvidia-container-toolkit](https://github.com/NVIDIA/nvidia-container-toolkit)
Install nvidia-container-toolkit according to the [installation guide](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#installation-guide)

`sudo usermod -aG docker kangjie`

restart your terminal

## Build image
`docker pull nvidia/cuda:11.2.1-cudnn8-devel-ubuntu20.04` or [other images](https://hub.docker.com/r/nvidia/cuda/tags)

`vim Dockerfile`

`docker build -t ckj_image .`

## Download Miniconda
`cd init_files/`

`wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh`


## Create a new container
`sudo ./create_containers.sh`




## Add a user for the container
> inside the container

`docker exec -it container_name /bin/bash`

`cd /home/user_name/`

`sudo bash add_user.sh`

`mv bash_profile /home/user_name/.bash_profile`

`exit`


> outside the container, test for the create user with the specific port

`ssh user_name@ip -p port`

`./Miniconda.sh`

`exit`

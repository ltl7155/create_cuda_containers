## Install docker and [nvidia-container-toolkit](https://github.com/NVIDIA/nvidia-container-toolkit)

Install nvidia-container-toolkit according to the [installation guide](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html#getting-started)

`sudo apt-get install nvidia-docker2`

`sudo usermod -aG docker kangjie`

restart your terminal

## Build image
`docker pull nvidia/cuda:11.2.1-cudnn8-devel-ubuntu20.04` or [other images](https://hub.docker.com/r/nvidia/cuda/tags)

`vim Dockerfile`

`docker build -t kangjie/contianer_image:cuda11.2.1-cudnn8-devel-ubuntu20.04 .`

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

`exit`


> outside the container, test for the create user with the specific port

`ssh user_name@ip -p port`

`bash Miniconda.sh`

`exit`

## login without password

> inside the local machine

`scp -P 32869 ~/.ssh/id_rsa.pub kangjie@155.69.148.30:~/`

```
# ~/.ssh/config
Host  server6kangjie
    HostName   155.69.148.30
    Port       32869
    User       kangjie
    IdentityFile    ~/.ssh/id_rsa
```

> inside the container

`mkdir ~/.ssh/`

`cat id_rsa.pub >> .ssh/authorized_keys`



# Check config for a container

> check container first and remeber the container ID

`docker ps`


> stop docker service

`sudo systemctl stop docker`

> check config file for the container

`sudo ls /var/lib/docker/containers/`

`sudo vim /var/lib/docker/containers/container-id/config.v2.json`


> start docker service

`sudo systemctl start docker`

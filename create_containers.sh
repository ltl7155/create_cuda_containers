#!/bin/bash
c=1;
for n in kangjie
    do nvidia-docker run -d \
        -e NVIDIA_VISIBLE_DEVICES=0 \
        --ipc=host \
        -h "5900-U$((2201+c))" \
        -p "$((50401+c)):80" \
        -p "$((40100+10*c)):8000" \
        -p "$((49448+10*c)):443" \
        -p "$((4900+c)):6006" \
        -p "$((4910+c)):6007"  \
        -p "$((32868+c)):22" \
        --name "$n"-U"$((2201+c))P$((50201+c))" \
        -v "/home/kangjie/data_drive/docker_user/$n:/home/$n"  \
        --restart=always \
        ckj_image:latest;
    cp -r init_files/ /home/kangjie/data_drive/docker_user/$n/;
    c=$((c+1));
done

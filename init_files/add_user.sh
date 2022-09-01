#!/bin/bash
# Script to add a user
if [ "$(id -u)" -eq 0 ]; then
        read -p "Enter uid  :" uid
        read -p "Enter username  :" username
        read -s -p "Enter passwd  :" password
        egrep "^$username" /etc/passwd > /dev/null
        if [ $? -eq 0 ]; then
                echo "username exits"
                exit 1
        else
                pass=$(perl -e 'print crypt($ARGV[0], "password")' $password)
                useradd -u $uid -m -p $pass $username
                [ $? -eq 0 ] && echo "User added" || "fail to add"
                usermod -aG sudo $username
                [ $? -eq 0 ] && echo "sudo have been added" || "Fail to add to sudo"
                chsh -s /bin/bash ${username}
                [ $? -eq 0 ] && echo "chsh have been added" || "Fail to change"
                chown -R $username:$username /home/$username
                [ $? -eq 0 ] && echo "changed the owner of home" || "Fail to changed the owner of home"
                sudo -v
                [ $? -eq 0 ] && echo "Done"
        fi
else
        echo "need root"
        exit 2
fi

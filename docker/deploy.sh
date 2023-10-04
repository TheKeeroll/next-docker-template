#!/usr/bin/sh

if [ $# -eq 0 ]
  then
    echo "No container name supplied"
    echo "Usage ./deploy.sh <CONTAINER_NAME> <SSH_BIND_PORT>"
fi

if [ -z "$2" ]
  then
    SSH_BIND = "-p"
else
  SSH_BIND = "-p $2"
fi

cd ..
sudo docker build -t "$CONTAINER_NAME_image" .
sudo docker run -d --name $CONTAINER_NAME $SSH_BIND

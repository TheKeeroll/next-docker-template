#!/usr/bin/sh
cd "$(dirname "$0")"
if [ $# -eq 0 ]
  then
    echo "No container name supplied"
    echo "Usage ./deploy.sh <CONTAINER_NAME> <SSH_BIND_PORT>"
    exit
fi
SSH_BIND=""
if [ -z "$2" ]
  then
    SSH_BIND="-p"
else
  SSH_BIND="-p $2"
fi

sudo docker build -t "${1}_image" ..
sudo docker run "${1}_image"  -d --name "$1" "$SSH_BIND"

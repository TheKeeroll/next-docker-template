#!/bin/sh
rc-status; rc-service sshd start;
cd /app
npm i --production
npm run build
rm -rf app
npm start
tail -f /dev/null

#!/bin/sh
rc-status; rc-service sshd start;
cd /app
npm i --omit=dev
npm run build
npm start
tail -f /dev/null

#!/bin/sh
rc-status; rc-service sshd start;
cd /app
npm i --production
npm run build
rm -rf app
rm .eslintrc.json .gitignore next-dev.d.ts README.md tailwind.consif.ts tsconfig.json
npm start
tail -f /dev/null

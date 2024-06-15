#!/bin/bash
logs_path=/logs/www.ccie.xyz
logs_date=`date -d "yesterday" +%F`
mv ${logs_path}/access.log ${logs_path}/access_${logs_date}.log && gzip ${logs_path}/access_${logs_date}.log
kill -USR1 $(cat /usr/local/nginx/logs/nginx.pid

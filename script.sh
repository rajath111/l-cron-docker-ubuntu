!/bin/bash

mkdir /cron_demo
touch /cron_demo/log_file.txt

# Reason is explained in Readme
# dos2unix /etc/cron.d/helloJob
crontab /etc/cron.d/helloJob
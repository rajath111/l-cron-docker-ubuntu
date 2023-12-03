FROM ubuntu:18.04

ARG jobFile=/etc/cron.d/helloJob
ARG logFile=/cron_demo/log_file.txt

# Install CORN
sudo apt-get update
sudo apt-get install cron
sudo systemctl enable cron

# Create CRON JOB file
touch @jobFile
echo "*/5 * * * * echo "Hello!!. Running scheduled job every 5 mins" >> @logFile" > @jobFile

touch logFile

# RUN the job
crontab @jobFile

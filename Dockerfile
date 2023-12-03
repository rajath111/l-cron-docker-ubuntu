FROM ubuntu:22.04

RUN apt-get update && apt-get install cron -y && apt-get install vim -y 
# Reason explained in Readme
# && apt-get install -y dos2unix

COPY ./helloJob.cron /etc/cron.d/helloJob
COPY ./script.sh /script.sh

RUN chmod +x /script.sh

# Running commands for the startup of a container.
CMD ["/bin/bash", "-c", "/script.sh && chmod 644 /etc/cron.d/helloJob && cron && tail -f /cron_demo/log_file.txt"]
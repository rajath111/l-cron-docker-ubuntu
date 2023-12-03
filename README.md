# l-cron-docker-ubuntu
The objective of this repository is to document how we can schedule CRON jobs in ubuntu using Docker.

CRON is a time based scheduling daemon/command line utility found in Unix based operating systems. CRON runs in background and operations scheduled to run by CRON are called as CRON jobs.

CRON jobs can be defined at root level or at user level.

## Install and setup CRON
1. Install CRON
```
    sudo apt update
    sudo apt install cron
```

2. Enable CRON
```
   sudo systemctl enable cron
```


## Create CRON job file
We can create a text file width CRON expression in it. The CRON expression is made up of two parts.
1. Schedule
2. Command to execute

Where, Command can be any command we can execute in the terminal.
Schedule can be configured with 5 options, minute, hour, day of month, month, day of week. It also supports wild cards such as:
1. \*  It runs at all time
2. / It can be used for specifying step (*/3, this runs at multiple o \3)
3. \- For range
4. , For list of values

Please refer to this resource for more info on CRON scheduling https://en.wikipedia.org/wiki/Cron.



## Example CRON job file
```
* * * * * echo "TEST 2" >> /cron_demo/logs.txt
5 * * * 1 echo "TEST 5" >> /cron_demo/logs.txt
```

The above CRON job file contains two jobs.
1. First job runs every minute and logs 'TEST 2' in log file.
2. Second job runs every 5 minutes on Mondays and logs 'TEST 5' in log file.

## Enable/Configure to run CRON job
We can manage CRON jobs using ```crontab``` utility installed when we install cron. 
1. Enable CRON job
```
   crontab <cron job file>
```
If we run the above command with root previlages then the job will be scheduled at system level else it will be scheduled at user level.

2. Stop the CRON jon
```
    crontab -r
```
Same goes for stopping jobs as well. If we use root previlages than system level CRON jobs will be removed else user level jobs will be removed.


## Notes
1. Best practices is to store CRON job files in ***/etc/cron.d/*** folder.

2. We can see the enabled jobs under ***/var/spool/cron/crontabs/****. Where * can be username or root.

3. We can also edit ***/etc/crontab*** file and add CRON expresions there. There is no need to use ```crontab``` command in this case.


## Resources
1. About CRON - https://www.digitalocean.com/community/tutorials/how-to-use-cron-to-automate-tasks-ubuntu-1804#managing-crontabs
2. CRON with Docker - https://devtron.ai/blog/running-a-cronjob-inside-docker-container-in-5-steps/
3. WIKI - https://en.wikipedia.org/wiki/Cron
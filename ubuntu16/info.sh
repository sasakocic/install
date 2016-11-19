#!/bin/bash

if [ "${debug}" == "1" ]; then
        set -x;
fi;

hostname=`hostname`;
actdate=`date +%Y-%m-%d`;
acttime=`date +%H:%M`;
uptime=`uptime | cut -d 'u' -f 2 | cut -d ',' -f -1 | cut -d ' ' -f 2-`;
load=`uptime | cut -d 'l' -f 2 | cut -d ':' -f 2 | cut -d ' ' -f 2-`;
usercount=`uptime | cut -d 'u' -f -3 | cut -d ',' -f 2- | cut -d 'e' -f 1 | cut -d ',' -f 2 | sed 's/\ //g' | cut -d 'u' -f 1`;
memtotal=`cat /proc/meminfo | grep MemTotal | cut -d ':' -f 2 | sed 's/kB//g' | sed 's/\ //g'`;
memtotalmb=$[${memtotal}/1024];
architecture=`uname -a | cut -d ' ' -f 12- | cut -d ' ' -f 1`;
kernelversion=`uname -a | cut -d ' ' -f 3`;
whoami=`whoami`;
userprocesses=`ps -ef | grep ${whoami} | wc -l`;
totalprocesses=`ps -ef | wc -l`;
userhome=`cat /etc/passwd | grep /${whoami} | cut -d ":" -f 6`;
userhomeused=`du -msh ${userhome} | awk '{print $1}'`;

### Output ###

echo -e ".:. System Information .:.";
echo -e "- Uptime:\t${uptime}";
echo -e "- Avg. load:\t${load}";
echo -e "- Active users:\t${usercount}";
echo -e "- Memory:\t${memtotalmb}MB";
echo -e "- Arch:\t\t${architecture}";
echo -e "- Kernel:\t${kernelversion}";
echo -e "- Procs:\t${userprocesses} out of ${totalprocesses} owned by you";
echo -e "- Disk Usage:\t${userhomeused} are used in ${userhome}";
echo -e "\n\033[31mLogged in as user \"${whoami}\" on system \"${hostname}\"\033[0m";

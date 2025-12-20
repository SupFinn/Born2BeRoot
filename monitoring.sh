#!/bin/bash

#--> Banner
banner="

███████╗██╗███╗   ██╗███╗   ██╗
██╔════╝██║████╗  ██║████╗  ██║
█████╗  ██║██╔██╗ ██║██╔██╗ ██║
██╔══╝  ██║██║╚██╗██║██║╚██╗██║
██║     ██║██║ ╚████║██║ ╚████║
╚═╝     ╚═╝╚═╝  ╚═══╝╚═╝  ╚═══╝

"

#--> Memory usage
total_mem=$(free -m | awk 'NR==2 {print $2}')
used_mem=$(free -m | awk 'NR==2 {print $3}')
mem_percent=$((100 * used_mem / total_mem))

#--> Disk usage
total_disk=$(df -h / | awk 'NR==2 {print $2}')
used_disk=$(df -h / | awk 'NR==2 {print $3}')
disk_percent=$(df / | awk 'NR==2 {print $5}')

#--> CPU load
cpu_load=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')

#--> LVM active
if lsblk | grep -q "lvm";then
    lvm_status="yes"
else
    lvm_status="no"
fi

#--> IP and MAC
ip_add=$(hostname -I | awk '{print $1}')
mac_add=$(ip l | grep "ether" | awk '{print $2}')

#--> Sudo commands executed
sudo_cmd=$(journalctl -q _COMM=sudo | grep "COMMAND" | wc -l)

#--> Message

msg="$banner
#Architecture: $(uname -a)
#CPU physical : $(lscpu | grep "Socket(s)" | awk '{print $2}')
#vCPU : $(nproc)
#Memory Usage: ${used_mem}/${total_mem}MB (${mem_percent}%)
#Disk Usage: ${used_disk}/${total_disk} (${disk_percent})
#CPU load: $cpu_load%
#Last boot: $(who -b | awk '{print $3, $4}')
#LVM use: $lvm_status
#Connections TCP : $(ss -t | grep "ESTAB" | wc -l) ESTABLISHED
#User log: $(who | wc -l)
#Network: IP $ip_add ($mac_add)
#Sudo : $sudo_cmd cmd"

wall "$msg" 

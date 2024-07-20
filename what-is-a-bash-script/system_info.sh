#!/bin/bash

cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')

free_memory=$(grep MemFree /proc/meminfo | awk '{print $2}')
total_memory=$(grep MemTotal /proc/meminfo | awk '{print $2}')
memory_usage=$((100 - (free_memory * 100 / total_memory)))

disk_usage=$(df -h / | grep / | awk '{print $5}')

uptime=$(uptime -p | awk '{print $2, $3}')

echo "CPU Usage: $cpu_usage%"
echo "Memory Usage: $memory_usage%"
echo "Uptime: $uptime"

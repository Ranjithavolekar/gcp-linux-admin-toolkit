#!/bin/bash

#......................
# GCP Linux Admin Toolkit
# Script: check_disk_memory.sh
# Purpose: Monitor disk and memory usage
#.......................


# Set thresholds
DISK_THRESHOLD=80
MEM_THRESHOLD=80

#log file (for no, local file; Later we can  move to /var/log)
LOG_FILE="./check_disk_memory.log"

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check disk usage on root
DISK_USAGE=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')

# Check memory usage
MEM_USAGE=$(free | grep  Mem |awk '{printf("%.0f" , $3/$2 * 100.0)}')

# Print the values
echo -e  "Disk Usage: ${DISK_USAGE}%"
echo -e "Memory Usage: ${MEM_USAGE}%"

# Disk check
if [ "$DISK_USAGE" -gt "$DISK_THRESHOLD" ]; then
  echo -e "${RED} WARNING: Disk usage above threshold!${NC}"
else
  echo -e "${GREEN} Disk usage is OK.${NC}"
fi

# Memory check
if [ "$MEM_USAGE" -gt "$MEM_THRESHOLD" ]; then
  echo -e "${RED} WARNING: Memory usage above threshold!${NC}"
else
  echo -e "${GREEN} Memory usage is OK.${NC}"
fi

# Log the output (basic log entry)
echo "[$(date)] Disk: ${DISK_USAGE}%, Memory: ${MEM_USAGE}%" >> "$LOG_FILE"

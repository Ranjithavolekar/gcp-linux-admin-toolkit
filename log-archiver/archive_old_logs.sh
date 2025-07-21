#!/bin/bash

#Variables
LOG_DIR="/var/log"
ARCHIVE_DIR="$HOME/log-archives"
DAYS_OLD=5
TIMESTAMP=$(date +%F_%H-%M-%S)
ARCHIVE_FILE="$ARCHIVE_DIR/old_logs_$TIMESTAMP.tar.gz"


#Create archive directory if not exists
mkdir -p "$ARCHIVE_DIR"

# Find and archive old Logs
find "$LOG_DIR" -type f -name "*.log" -mtime +$DAYS_OLD -print0 | tar -czvf "$ARCHIVE_FILE" --null -T -


#Optional: Delete the original old Logs
find "$LOG_DIR" -type f -name "*.log" -mtime +$DAYS_OLD -exec rm -f {} \;

echo "Archived logs older than $DAYS_OLD days to $ARCHIVE_FILE"

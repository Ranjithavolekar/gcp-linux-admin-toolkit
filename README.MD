# GCP Linx Admin Toolkit

## Script: check_disk_memory.sh
 
This scripts monitors disk and memory usage on a GCE Linx VM and:

- Checks current disk and RAM usage
- Alerts if any crosses 80%
- Displays color-coded messages
- Logs the output into 'check_disk_memory.log'

## Technologies Used

-Bash 
- 'df' , 'free' , 'awk' , 'sed'
- Crontab

## Usage

'''bash
chmod +x check_disk_memory.sh
./check_disk_memory.sh

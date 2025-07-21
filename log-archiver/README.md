# Log Archiver Script

## What it does:
-Scans `/var/log` for `.log` files older than 5 days
-Archives them into a timestamped `.tar.gz` file
-Deletes the original files to free up space

---

## Technologies Used:
-Bash scripting
- `find` , `tar` , `rm` , `cron`
- `sudo` (to access protected log files)


---

## Usage:
 
Make executable:
```bash
chmod +x archive_old_logs.sh

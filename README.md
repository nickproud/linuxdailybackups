# Linux Daily Backups

# Incremental Backup Script

This Bash script performs incremental backups using rsync and allows you to specify the source and destination directories.

## Usage

```bash
./dailybackup.sh <source_directory> <destination_directory>
```

Replace <source_directory> and <destination_directory> with the actual paths you want to use for the backup.

## Features
 - Incremental Backups: Uses rsync to perform incremental backups, saving disk space.
 - Timestamped Backups: Each backup is timestamped for easy identification.
 - Latest Symlink: Maintains a 'latest' symlink pointing to the most recent backup for quick access.
 - Optional Old Backup Removal: Removes old backups based on a configurable retention policy.

## Setup

1. Navigate to the script directory:
```bash
  cd path/to/script/
```
2. Make the script executable
```bash
  chmod +x dailybackup.sh
```
3. Run the script
```bash
  ./dailybackup.sh <source_directory> <destination_directory>
```
You will most likely want to be able to schedule this script! You can use ```crontab``` to achieve this. 

## Schedule the Script To Run at 2am daily
1. Open Crontab
```bash
  crontab -e
```
2. Add cron entry pointing to your script path
```bash
  0 2 * * * /path/to/script/dailybackup.sh <source_directory> <destination_directory>
```

## Acknowledgements
I certainly can't take a lot of credit for this one. I had help from ChatGPT! Thanks #OpenAi 🙏

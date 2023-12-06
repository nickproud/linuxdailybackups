#!/bin/bash

# Check if both source and destination directories are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <source_directory> <destination_directory>"
    exit 1
fi

# Set the source and destination directories
source_directory="$1"
destination_directory="$2"

# Create a timestamp for the backup folder
timestamp=$(date +"%Y%m%d_%H%M%S")
backup_folder="$destination_directory/backup_$timestamp"

# Perform the backup using rsync
rsync -a --delete --link-dest="$destination_directory/latest" "$source_directory" "$backup_folder"

# Update the 'latest' symlink to point to the most recent backup
rm -f "$destination_directory/latest"
ln -s "$backup_folder" "$destination_directory/latest"

# Print a message indicating the backup is complete
echo "Backup completed at $(date)"

# Optional: Remove old backups (e.g., keep backups for the last 7 days)
find "$destination_directory" -maxdepth 1 -type d -mtime +7 -exec rm -rf {} \;

# End of the script

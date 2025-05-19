#!/bin/bash

# Variables
REPORT_DIR="$HOME/disk_reports"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
REPORT_FILE="$REPORT_DIR/disk_report_$TIMESTAMP.txt"
LARGEST_FILES="$REPORT_DIR/largest_files_$TIMESTAMP.txt"

# Create report directory if not exists
mkdir -p "$REPORT_DIR"

# Disk Usage Summary
echo "===== DISK USAGE REPORT ($TIMESTAMP) =====" > "$REPORT_FILE"
df -h >> "$REPORT_FILE"

# Top 10 Largest Directories (change '/' as needed)
echo -e "\n===== TOP 10 LARGEST DIRECTORIES =====" >> "$REPORT_FILE"
du -ah / 2>/dev/null | sort -rh | head -n 10 >> "$REPORT_FILE"

# Top 10 Largest Files
echo -e "\n===== TOP 10 LARGEST FILES =====" > "$LARGEST_FILES"
find / -type f -exec du -h 2>/dev/null {} + | sort -rh | head -n 10 >> "$LARGEST_FILES"

echo "Reports generated:"
echo "$REPORT_FILE"
echo "$LARGEST_FILES"

chmod +x disk_analytics.sh

./disk_analytics.sh
Reports generated:
/home/mint/disk_reports/disk_report_2025-05-10_09-58-39.txt
/home/mint/disk_reports/largest_files_2025-05-10_09-58-39.txt


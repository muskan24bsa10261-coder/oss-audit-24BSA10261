#!/bin/bash
# ============================================================
# Script 4: Log File Analyzer
# Author: Muskan Pathak | Roll: 24BSA10261
# Course: Open Source Software | OSS Audit — Git
# Description: Reads a log file line by line, counts keyword
#              occurrences, and prints matching lines summary.
# Usage: ./script4_log_analyzer.sh <logfile> [keyword]
# Example: ./script4_log_analyzer.sh /var/log/syslog error
# ============================================================

# --- Read command-line arguments ---
LOGFILE=$1                  # First argument: path to the log file
KEYWORD=${2:-"error"}       # Second argument: keyword to search (default: "error")

COUNT=0                     # Counter variable to track keyword matches
MAX_RETRIES=3               # Maximum number of retry attempts if file is empty

echo "========================================================"
echo "     Log File Analyzer"
echo "========================================================"
echo "  Log File : $LOGFILE"
echo "  Keyword  : $KEYWORD"
echo ""

# --- Validate: check if a log file argument was provided ---
if [ -z "$LOGFILE" ]; then
    echo "Error: No log file specified."
    echo "Usage: $0 <logfile> [keyword]"
    echo "Example: $0 /var/log/syslog error"
    exit 1
fi

# --- Validate: check if the log file actually exists ---
if [ ! -f "$LOGFILE" ]; then
    echo "Error: File '$LOGFILE' not found."
    exit 1
fi

# --- Do-while style retry loop if the file is empty ---
# This simulates a retry mechanism — useful if a log file is being written to
ATTEMPT=1
while [ $ATTEMPT -le $MAX_RETRIES ]; do
    if [ -s "$LOGFILE" ]; then
        # File has content, proceed
        break
    else
        echo "  [Attempt $ATTEMPT/$MAX_RETRIES] File is empty. Retrying in 1 second..."
        sleep 1
        ATTEMPT=$((ATTEMPT + 1))
    fi
done

# --- Final check after retries ---
if [ ! -s "$LOGFILE" ]; then
    echo "  File is still empty after $MAX_RETRIES attempts. Exiting."
    exit 1
fi

echo "--- Scanning log file... ---"
echo ""

# --- While-read loop: read the file line by line ---
# IFS= prevents stripping of leading/trailing whitespace
# -r prevents backslash interpretation
while IFS= read -r LINE; do

    # --- If-then: check if the current line contains the keyword ---
    # grep -iq makes the search case-insensitive and quiet (no output)
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))   # Increment counter for each match
    fi

done < "$LOGFILE"    # Redirect file contents into the while loop

# --- Print summary ---
echo "========================================================"
echo "  Keyword  : '$KEYWORD'"
echo "  Found    : $COUNT time(s) in '$LOGFILE'"
echo "========================================================"
echo ""

# --- Print the last 5 matching lines using grep + tail ---
echo "--- Last 5 lines containing '$KEYWORD' ---"
MATCHES=$(grep -i "$KEYWORD" "$LOGFILE" | tail -5)

if [ -z "$MATCHES" ]; then
    echo "  No matching lines found."
else
    echo "$MATCHES"
fi

echo ""
echo "========================================================"
echo "  Tip: On a Git-based project, logs are stored in"
echo "  .git/logs/ — you can run this script on those files"
echo "  to analyze repository activity."
echo "========================================================"

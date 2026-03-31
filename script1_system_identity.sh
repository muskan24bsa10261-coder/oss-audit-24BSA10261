#!/bin/bash
# ============================================================
# Script 1: System Identity Report
# Author: [Your Name] | Roll: [Your Roll Number]
# Course: Open Source Software | OSS Audit — Git
# Description: Displays a welcome screen with key system info
# ============================================================

# --- Variables ---
STUDENT_NAME="[Your Name]"         # Replace with your name
SOFTWARE_CHOICE="Git"              # Our chosen open-source software

# --- Gather system information using command substitution ---
KERNEL=$(uname -r)                         # Linux kernel version
USER_NAME=$(whoami)                        # Currently logged-in user
HOME_DIR=$HOME                            # User's home directory
UPTIME=$(uptime -p)                       # Human-readable uptime
CURRENT_DATE=$(date '+%d %B %Y, %H:%M:%S') # Formatted date and time

# --- Detect Linux distribution name ---
# /etc/os-release is the standard file for distro info on modern Linux
if [ -f /etc/os-release ]; then
    DISTRO=$(grep -w "PRETTY_NAME" /etc/os-release | cut -d= -f2 | tr -d '"')
else
    DISTRO="Unknown Distribution"
fi

# --- License info for the OS kernel ---
# Linux kernel is licensed under GPL v2 (GNU General Public License)
OS_LICENSE="GNU General Public License v2 (GPL v2)"

# --- Display the system identity report ---
echo "========================================================"
echo "     Open Source Audit — System Identity Report"
echo "========================================================"
echo ""
echo "  Student     : $STUDENT_NAME"
echo "  Software    : $SOFTWARE_CHOICE"
echo ""
echo "  Distribution: $DISTRO"
echo "  Kernel      : $KERNEL"
echo "  OS License  : $OS_LICENSE"
echo ""
echo "  Logged in as: $USER_NAME"
echo "  Home Dir    : $HOME_DIR"
echo "  Uptime      : $UPTIME"
echo "  Date & Time : $CURRENT_DATE"
echo ""
echo "========================================================"
echo "  This system runs open-source software licensed under"
echo "  the $OS_LICENSE."
echo "  You are free to run, study, share, and modify it."
echo "========================================================"

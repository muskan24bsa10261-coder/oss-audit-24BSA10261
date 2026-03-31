#!/bin/bash
# ============================================================
# Script 3: Disk and Permission Auditor
# Author: Muskan Pathak | Roll: 24BSA10261
# Course: Open Source Software | OSS Audit — Git
# Description: Loops through key system directories and reports
#              their disk usage, owner, and permissions.
# ============================================================

# --- List of important system directories to audit ---
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

# --- Git's typical config directory on Linux ---
GIT_CONFIG_DIR="/etc/gitconfig"   # System-wide git config file
GIT_TEMPLATE_DIR="/usr/share/git-core"  # Git template directory

echo "========================================================"
echo "     Disk and Permission Auditor"
echo "========================================================"
echo ""
printf "%-20s %-25s %-10s\n" "Directory" "Permissions (perms user group)" "Size"
echo "------------------------------------------------------------------------"

# --- For loop: iterate over each directory in the list ---
for DIR in "${DIRS[@]}"; do

    # Check if the directory actually exists before accessing it
    if [ -d "$DIR" ]; then
        # Use ls -ld to get directory metadata, then awk to extract fields
        # Field 1 = permissions, Field 3 = owner, Field 4 = group
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')

        # Use du to get disk usage; 2>/dev/null suppresses permission errors
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)

        # Print formatted output using printf for alignment
        printf "%-20s %-25s %-10s\n" "$DIR" "$PERMS" "$SIZE"
    else
        # Directory does not exist on this system
        printf "%-20s %-35s\n" "$DIR" "[does not exist on this system]"
    fi

done

echo ""
echo "========================================================"
echo "     Git Software Config Audit"
echo "========================================================"
echo ""

# --- Check if Git's system-wide config file exists ---
if [ -f "$GIT_CONFIG_DIR" ]; then
    echo "[OK] Git system config found: $GIT_CONFIG_DIR"
    # Get permissions and ownership of the git config file
    CONFIG_PERMS=$(ls -l "$GIT_CONFIG_DIR" | awk '{print $1, $3, $4}')
    echo "     Permissions: $CONFIG_PERMS"
else
    echo "[--] Git system config ($GIT_CONFIG_DIR) not found."
    echo "     Git may not be installed, or no system config has been set."
fi

echo ""

# --- Check if Git template directory exists ---
if [ -d "$GIT_TEMPLATE_DIR" ]; then
    echo "[OK] Git template directory found: $GIT_TEMPLATE_DIR"
    TEMPLATE_PERMS=$(ls -ld "$GIT_TEMPLATE_DIR" | awk '{print $1, $3, $4}')
    TEMPLATE_SIZE=$(du -sh "$GIT_TEMPLATE_DIR" 2>/dev/null | cut -f1)
    echo "     Permissions : $TEMPLATE_PERMS"
    echo "     Size        : $TEMPLATE_SIZE"
else
    echo "[--] Git template directory ($GIT_TEMPLATE_DIR) not found."
fi

echo ""
echo "  Security Note: /etc is owned by root to prevent unauthorised"
echo "  modification of system configuration. /tmp is world-writable"
echo "  (sticky bit set) so all users can create files but not delete"
echo "  files owned by others."
echo "========================================================"

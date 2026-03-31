#!/bin/bash
# ============================================================
# Script 2: FOSS Package Inspector
# Author: Muskan Pathak | Roll: 24BSA10261
# Course: Open Source Software | OSS Audit — Git
# Description: Checks if a FOSS package is installed,
#              displays its details, and prints a philosophy note.
# ============================================================

# --- Set the package to inspect ---
PACKAGE="git"   # Our chosen open-source software

echo "========================================================"
echo "     FOSS Package Inspector — $PACKAGE"
echo "========================================================"
echo ""

# --- Check if the package is installed using if-then-else ---
# We try both dpkg (Debian/Ubuntu) and rpm (RHEL/CentOS/Fedora)
if command -v dpkg &>/dev/null; then
    # Debian/Ubuntu based system
    if dpkg -l "$PACKAGE" 2>/dev/null | grep -q "^ii"; then
        echo "[OK] '$PACKAGE' is INSTALLED on this system."
        echo ""
        echo "--- Package Details ---"
        # Extract version, architecture, and description
        dpkg -l "$PACKAGE" | grep "^ii" | awk '{print "  Version      : "$3"\n  Architecture : "$4"\n  Description  : "$5,$6,$7,$8,$9}'
    else
        echo "[!!] '$PACKAGE' is NOT installed."
        echo "     To install, run: sudo apt install $PACKAGE"
    fi

elif command -v rpm &>/dev/null; then
    # RPM based system (RHEL, CentOS, Fedora)
    if rpm -q "$PACKAGE" &>/dev/null; then
        echo "[OK] '$PACKAGE' is INSTALLED on this system."
        echo ""
        echo "--- Package Details ---"
        # Use grep with -E to show only specific fields
        rpm -qi "$PACKAGE" | grep -E "^(Version|License|Summary|Packager)"
    else
        echo "[!!] '$PACKAGE' is NOT installed."
        echo "     To install, run: sudo yum install $PACKAGE  OR  sudo dnf install $PACKAGE"
    fi

else
    # Fallback: try running the command directly
    if command -v "$PACKAGE" &>/dev/null; then
        echo "[OK] '$PACKAGE' is available on this system."
        echo "  Version: $($PACKAGE --version 2>&1 | head -1)"
    else
        echo "[!!] '$PACKAGE' is NOT found on this system."
    fi
fi

echo ""
echo "--- Open Source Philosophy Note ---"

# --- Case statement: print a philosophy note based on package name ---
case $PACKAGE in
    git)
        echo "  Git: Born out of frustration with proprietary version control."
        echo "  Linus Torvalds built it in 2005 after BitKeeper revoked its"
        echo "  free license from the Linux community. Git is now the backbone"
        echo "  of global open-source collaboration."
        ;;
    httpd | apache2)
        echo "  Apache: The web server that built the open internet."
        echo "  First released in 1995, it made web hosting accessible to all."
        ;;
    mysql | mariadb)
        echo "  MySQL/MariaDB: Open source at the heart of millions of apps."
        echo "  MariaDB itself is a community fork — a lesson in why open"
        echo "  source licensing truly matters."
        ;;
    vlc)
        echo "  VLC: Built by students at a French university who needed a"
        echo "  free tool to stream video. Now plays everything, everywhere."
        ;;
    firefox)
        echo "  Firefox: A nonprofit fighting for an open web."
        echo "  Mozilla built it to keep the browser market from being"
        echo "  monopolised by proprietary giants."
        ;;
    python3 | python)
        echo "  Python: A language shaped entirely by community consensus."
        echo "  The PSF license ensures it stays free and universally usable."
        ;;
    *)
        echo "  '$PACKAGE' is an open-source tool that embodies the principle"
        echo "  that knowledge should be freely shared and collectively improved."
        ;;
esac

echo ""
echo "========================================================"

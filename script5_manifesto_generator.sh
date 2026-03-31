#!/bin/bash
# ============================================================
# Script 5: Open Source Manifesto Generator
# Author: Muskan Pathak | Roll: 24BSA10261
# Course: Open Source Software | OSS Audit — Git
# Description: Asks the user three questions interactively,
#              then generates a personalised open-source
#              philosophy statement and saves it to a .txt file.
# ============================================================

# --- Alias concept (demonstrated via comment) ---
# In a real shell session, you might define:
#   alias today='date +%d-%B-%Y'
# Aliases are shortcuts for commands, commonly used in ~/.bashrc
# Here we use a variable to simulate this concept:
TODAY=$(date '+%d %B %Y')         # Current date, formatted nicely
AUTHOR=$(whoami)                  # The current system user

echo "========================================================"
echo "     Open Source Manifesto Generator"
echo "========================================================"
echo "  Answer three questions to generate your personal"
echo "  open-source philosophy statement."
echo ""

# --- User input using 'read' with prompts ---
read -p "1. Name one open-source tool you use every day: " TOOL
read -p "2. In one word, what does 'freedom' mean to you?  " FREEDOM
read -p "3. Name one thing you would build and share freely: " BUILD

echo ""

# --- Define the output filename using string concatenation ---
OUTPUT="manifesto_${AUTHOR}.txt"

# --- Compose the manifesto paragraph using the user's answers ---
# String concatenation is done by placing variables next to text
# '>' creates/overwrites the file; '>>' appends to it

echo "========================================" > "$OUTPUT"
echo "  My Open Source Manifesto" >> "$OUTPUT"
echo "  Written by: $AUTHOR | $TODAY" >> "$OUTPUT"
echo "========================================" >> "$OUTPUT"
echo "" >> "$OUTPUT"

# --- Main paragraph using all three user inputs ---
echo "Every day, I rely on $TOOL — a piece of software that someone" >> "$OUTPUT"
echo "built, shared, and handed to the world without asking for anything" >> "$OUTPUT"
echo "in return. That act of generosity is what open source means to me." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "To me, freedom in software means '$FREEDOM'. It means that I should" >> "$OUTPUT"
echo "be able to look inside the tools I depend on, understand how they" >> "$OUTPUT"
echo "work, change them to suit my needs, and pass those improvements on" >> "$OUTPUT"
echo "to others. When source code is locked away, that freedom disappears." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "Inspired by the spirit of open source, I commit to one day building" >> "$OUTPUT"
echo "$BUILD and releasing it freely — because the best way to honour the" >> "$OUTPUT"
echo "shoulders we stand on is to become a shoulder for someone else." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "Open source is not just a licensing model. It is a belief that" >> "$OUTPUT"
echo "knowledge shared is knowledge multiplied." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "  -- $AUTHOR, $TODAY" >> "$OUTPUT"
echo "========================================" >> "$OUTPUT"

# --- Confirm the file was saved ---
echo "========================================================"
echo "  Manifesto saved to: $OUTPUT"
echo "========================================================"
echo ""

# --- Display the saved file ---
cat "$OUTPUT"

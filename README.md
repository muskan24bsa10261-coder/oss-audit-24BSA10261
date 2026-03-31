# OSS Audit — Git
### Open Source Software | Capstone Project
**Student:** Muskan Pathak | **Roll Number:** 24BSA10261
**Chosen Software:** Git (Version Control System) | **License:** GPL v2

---

## About This Project

This repository is part of the **Open Source Audit** capstone project for the OSS NGMC course. The project involves a structured audit of **Git**, one of the most widely used open-source tools in the world — covering its origin story, license analysis, ethical reflection, Linux footprint, ecosystem, and comparison with proprietary alternatives.

---

## Repository Structure

```
oss-audit-[rollnumber]/
├── README.md                            ← This file
├── script1_system_identity.sh           ← System Identity Report
├── script2_package_inspector.sh         ← FOSS Package Inspector
├── script3_disk_permission_auditor.sh   ← Disk and Permission Auditor
├── script4_log_analyzer.sh              ← Log File Analyzer
└── script5_manifesto_generator.sh       ← Open Source Manifesto Generator
```

---

## Scripts Overview

### Script 1 — System Identity Report
Displays a formatted welcome screen showing the Linux distribution, kernel version, logged-in user, home directory, system uptime, current date/time, and the OS license.

**Concepts used:** Variables, `echo`, command substitution `$()`, output formatting.

---

### Script 2 — FOSS Package Inspector
Checks whether `git` is installed on the system, shows version and license details, and uses a `case` statement to print a philosophy note about the package.

**Concepts used:** `if-then-else`, `case` statement, `dpkg`/`rpm`, `grep` with pipes.

---

### Script 3 — Disk and Permission Auditor
Loops through key system directories (`/etc`, `/var/log`, `/home`, `/usr/bin`, `/tmp`) and reports the permissions, owner, group, and disk usage of each. Also audits Git's config files specifically.

**Concepts used:** `for` loop, `ls -ld`, `du -sh`, `awk`, `cut`.

---

### Script 4 — Log File Analyzer
Reads a log file line by line, counts how many lines contain a given keyword, and prints the last 5 matching lines. Includes a retry mechanism if the file is empty.

**Concepts used:** `while read` loop, `if-then`, counter variables, command-line arguments (`$1`, `$2`), `grep`, `tail`.

---

### Script 5 — Open Source Manifesto Generator
Asks the user three interactive questions and generates a personalised open-source philosophy statement, saving it to a `.txt` file.

**Concepts used:** `read` for user input, string concatenation, writing to a file with `>` and `>>`, `date` command, alias concept (demonstrated via comment).

---

## How to Run the Scripts

### Prerequisites
- A Linux system (Ubuntu, Debian, Fedora, CentOS, or any major distro)
- Bash shell (pre-installed on all Linux systems)
- Git installed: `sudo apt install git` (Debian/Ubuntu) or `sudo dnf install git` (Fedora)

### Step 1: Clone the repository
```bash
git clone https://github.com/[your-username]/oss-audit-[rollnumber].git
cd oss-audit-[rollnumber]
```

### Step 2: Make scripts executable
```bash
chmod +x script1_system_identity.sh
chmod +x script2_package_inspector.sh
chmod +x script3_disk_permission_auditor.sh
chmod +x script4_log_analyzer.sh
chmod +x script5_manifesto_generator.sh
```

### Step 3: Run the scripts

**Script 1 — System Identity Report:**
```bash
./script1_system_identity.sh
```

**Script 2 — FOSS Package Inspector:**
```bash
./script2_package_inspector.sh
```

**Script 3 — Disk and Permission Auditor:**
```bash
./script3_disk_permission_auditor.sh
```
> Note: Some directories like `/var/log` may require `sudo` for full size reporting.

**Script 4 — Log File Analyzer:**
```bash
./script4_log_analyzer.sh /var/log/syslog error
# Or with a custom keyword:
./script4_log_analyzer.sh /var/log/syslog warning
```
> Replace `/var/log/syslog` with any log file path available on your system.

**Script 5 — Open Source Manifesto Generator:**
```bash
./script5_manifesto_generator.sh
# Follow the interactive prompts
```

---

## Dependencies

| Dependency | Purpose | Install Command |
|---|---|---|
| `git` | The audited software | `sudo apt install git` |
| `bash` | Shell interpreter | Pre-installed |
| `coreutils` | `du`, `ls`, `date`, etc. | Pre-installed |
| `dpkg` or `rpm` | Package inspection | Pre-installed (distro-specific) |

---

## Notes

- All scripts are written for **Bash** and tested on Ubuntu/Debian-based systems.
- Scripts include inline comments explaining every non-obvious line.
- Script 4 requires a valid log file path as an argument.
- Script 5 saves output to `manifesto_<username>.txt` in the current directory.

---

*Open Source Software Capstone | VITyarthi*

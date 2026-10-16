#!/bin/bash
LOGFILE="$HOME/ds1202-project/logs/sysinfo_$(date +%Y%m%d_%H%M%S).log"

{
echo "===== System Information Report ====="
echo "Date     : $(date)"
echo "Hostname : $(hostname)"
echo "OS/Kernel: $(grep PRETTY_NAME /etc/os-release | cut -d'"' -f2) / $(uname -r)"
echo ""
echo "--- Uptime & CPU Load ---"
uptime -p
echo "Load avg : $(cut -d' ' -f1-3 /proc/loadavg)"
echo ""
echo "--- Memory Usage ---"
free -h
echo ""
echo "--- Disk Usage ---"
df -h /
} | tee "$LOGFILE"

echo ""
echo "Report saved to $LOGFILE"

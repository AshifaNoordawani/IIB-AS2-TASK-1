#!/bin/bash
echo "=== System Information Report ==="
echo "Hostname: $(hostname)"
echo "OS/Kernel: $(uname -r)"
echo "Memory Usage:"
free -h
echo "Disk Usage:"
df -h /

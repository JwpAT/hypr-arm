#!/bin/sh

# Create a temp file for the download test
TMPFILE=$(mktemp)

# Fast ping check with 0.3s timeout
ping -q -c 1 -W 0.3 8.8.8.8 > /dev/null
if [ $? -ne 0 ]; then
    # No internet
    firefox -P openwebui --new-window http://localhost:8080 &
    exit 0
fi

# Internet is up — test speed with 10KB file
START=$(date +%s%3N)
curl -s --max-time 2 -o "$TMPFILE" https://speed.hetzner.de/10KB.bin
END=$(date +%s%3N)

# Clean up
rm -f "$TMPFILE"

# Time in milliseconds
DURATION=$((END - START))

# 10KB = 80 kilobits → 100 Kbps = ~800ms → Allow 850ms
if [ "$DURATION" -le 850 ]; then
    # Internet is fast enough (≥ 100 Kbps)
    firefox -P openwebui --new-window https://chatgpt.com/ &
else
    # Internet is too slow
    firefox -P openwebui --new-window http://localhost:8080 &
fi

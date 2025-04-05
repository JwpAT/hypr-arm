#!/bin/bash
hour=$(date +"%H")
if [ "$hour" -ge 5 ] && [ "$hour" -lt 12 ]; then
  echo "good morning, $USER"
elif [ "$hour" -ge 12 ] && [ "$hour" -lt 17 ]; then
  echo "good afternoon, $USER"
else
  echo "good evening, $USER"
fi

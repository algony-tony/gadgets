#!/bin/bash

url="source_url"

while true; do
  wget --continue --tries=0 --read-timeout=20 --waitretry=5 "$url"
  if [ $? -eq 0 ]; then
    echo "Download completed successfully."
    exit 0
  else
    echo "Download failed. Retrying in 5 seconds..."
    sleep 5
  fi
done


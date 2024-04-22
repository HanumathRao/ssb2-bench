#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

# Check if the directory exists
if [ ! -d "$1" ]; then
    echo "Error: Directory $1 does not exist."
    exit 1
fi

printf "%-10s \t %-10s \t %-10s\n" "Query" "tpch_timing" "ssb2_timing"
printf "%s\n" "----------------|------------|---------------"
for i in {01..22}; do
    if [ -f "$1/tpch/Q$i.out" ] && [ -f "$1/ssb2/Q$i.out" ]; then
        tpch_timing=$(awk '/Time: [0-9]+\.[0-9]+ ms/ {match($0, /[0-9]+\.[0-9]+/); print substr($0, RSTART, RLENGTH)}' "$1/tpch/Q$i.out")
        ssb2_timing=$(awk '/Time: [0-9]+\.[0-9]+ ms/ {match($0, /[0-9]+\.[0-9]+/); print substr($0, RSTART, RLENGTH)}' "$1/ssb2/Q$i.out")
        printf "Q%-10s \t %-10s \t %-10s\n" "$i" "$tpch_timing" "$ssb2_timing"
    fi
done

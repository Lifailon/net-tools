#!/bin/bash
fc=$(du -a $1 2> /dev/null | awk '{print $2}' | xargs fincore 2> /dev/null)
echo -e "PAGE\tSIZE\tPATH"
printf "%s\n" "${fc[@]}" | grep -wvE "0B|SIZE" | awk 'BEGIN {OFS="\t"}; {print $1,$3,$4}'
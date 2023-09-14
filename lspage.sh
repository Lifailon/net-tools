#!/bin/bash
# version 1:
# array=($(du -a $1 2> /dev/null | awk '{print $2}'))
# echo -e "PAGE\tSIZE\tPATH"
# for a in ${array[@]}
# do
# fc=$(fincore -n $a 2> /dev/null)
# page_count=$(echo $fc | awk '{print $2}')
# if [ ${#fc} -eq 0 ]
# then
# continue
# elif [ $page_count -ne 0 ]
# then
# echo $fc | awk 'BEGIN {OFS="\t"}; {print $1,$3,$4}'
# fi
# done
# version 2:
fc=$(du -a $1 2> /dev/null | awk '{print $2}' | xargs fincore 2> /dev/null)
echo -e "PAGE\tSIZE\tPATH"
printf "%s\n" "${fc[@]}" | grep -wvE "0B|SIZE" | awk 'BEGIN {OFS="\t"}; {print $1,$3,$4}'
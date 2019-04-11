#!/bin/bash

# Define a timestamp function
timestamp() {
  date "+%Y-%m-%d %H:%M:%S"
}

tmp_file=tmp_diary.txt

if [ $# -lt 1 ]
then
    vim $tmp_file
    value=`cat $tmp_file`

    count=0
    while read line; do
        if [ $count = 0 ]
        then
            echo "[$(timestamp)]: $line" >> ~/Documents/uio/master/thesis/diary/diary.txt
        else
            echo "                       $line" >> ~/Documents/uio/master/thesis/diary/diary.txt
        fi
        count=$count+1
    done < $tmp_file

    rm $tmp_file
else
    echo "[$(timestamp)]: $@" >> ~/Documents/uio/master/thesis/diary/diary.txt
fi

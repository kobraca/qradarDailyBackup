#!/bin/bash
#title           :backuper.sh
#description     :This script gets a copy of last days logs and records on QRadar
#author          :Burak Karaca from KocSistem SOC
#date            :20171109
#version         :0.1
#usage           :bash backuper.sh
#notes           :You need to create daily_backup folder in store directory. You can change directory to anywhere, like a NAS...
day=$(date --date="1 day ago" +%d)
if [[ $day == 0* ]];
        then day="${day:1}";
fi

month=$(date --date="1 day ago" +%m)
if [[ $month == 0* ]];
        then month="${month:1}";
fi

backup_directory=/store/daily_backup/

year=$(date --date="1 day ago" +%Y)
file_path=/store/ariel/events/payloads/$year/$month/$day
file_path_records=/store/ariel/events/records/$year/$month/$day
day=$(date --date="1 day ago" +%d)

tar cvzf $backup_directory$year$month$day.payloads.zip $file_path
tar cvzf $backup_directory$year$month$day.records.zip $file_path_records

removeday=$(date --date="2 day ago" +%d)
removemonth=$(date --date="2 day ago" +%m)
removeyear=$(date --date="2 day ago" +%Y)

rm -f $backup_directory$removeyear$removemonth$removeday*

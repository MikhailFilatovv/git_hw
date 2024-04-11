#!/bin/bash

log="/var/log/backup.log" 
rsync_log="/var/log/rsync/rsync_backup.log" 
dest="/backup/" 
src="/home/skauron/"
hostname=ansible-server
host_ip="192.168.1.6"
user="skauron"
date=$(date +%d-%m-%y_%H:%M)

# создаем файл для лога вывода

if [ ! -d /var/log/rsync ]; then
    mkdir /var/log/rsync
    touch "${rsync_log}"
fi
# создаем папку для инкрементных бэкапов

mkdir -p ${dest}${hostname}/increment/

# Запускаем бэкап

echo "$(date '+%b %d %H:%M:%S') ${hostname} Rsync: Starting daily backup ${hostname}" | tee -a "${log}"
rsync -azrptgocv --delete --exclude='.*/' -e "ssh -i /home/skauron/.ssh/id_rsa" ${user}@${host_ip}:${src} ${dest}${hostname}/current/ --backup --backup-dir=${dest}${hostname}/increment/${date}/ | tee -a "${rsync_log}"
find ${dest}${hostname}/increment/ -maxdepth 1 -type d -mtime +5 -exec rm -rf {} \; # удаляет ежедневные копии старше 5 дней

# Обрабатываем ошибки
status=$?
if [ ${status} -ne 0 ]; then
    echo "Rsync failed with exit code $status" | tee -a "${log}"
    exit $status
else
    echo "Rsync completed successfully." | tee -a "${log}"
fi

echo "$(date '+%b %d %H:%M:%S') ${hostname} Rsync: Finished daily backup ${hostname}" | tee -a "${log}"

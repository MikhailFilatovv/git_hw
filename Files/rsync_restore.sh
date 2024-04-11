#!bin/bash

log="/var/log/backup.log"
rsync_log="/var/log/rsync/rsync_backup.log"
dest="/home/skauron/"
src="/backup/"
hostname=ansible-server
rsync_srv_ip="192.168.1.12"
user="skauron"
backup_date="11-04-24_21:52"

# создаем файл для лога вывода

if [ ! -d /var/log/rsync ]; then
    mkdir /var/log/rsync
    touch "${rsync_log}"
fi

# Запускаем восстановление

echo "$(date '+%b %d %H:%M:%S') ${hostname} Rsync: Starting restore ${hostname}" | tee -a "${log}"
rsync -azrptgocv -e "ssh -i /home/skauron/.ssh/id_rsa" ${user}@${rsync_srv_ip}:${src}${hostname}/current/ ${dest} | tee -a "${rsync_log}"
rsync -azrptgocv -e "ssh -i /home/skauron/.ssh/id_rsa" ${user}@${rsync_srv_ip}:${src}${hostname}/increment/${backup_date}/ ${dest} | tee -a "${rsync_log}"

# Обрабатываем ошибки
status=$?
if [ ${status} -ne 0 ]; then
    echo "Rsync failed with exit code $status" | tee -a "${log}"
    exit $status
else
    echo "Rsync completed successfully." | tee -a "${log}"
fi

echo "$(date '+%b %d %H:%M:%S') ${hostname} Rsync: Restore ${hostname} on ${backup_date} complete" | tee -a "${log}"

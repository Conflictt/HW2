#!/bin/bash

logfile=/usr/local/etc/bashlog.sh

#IP
echo''
echo "# Список часто запрашиваемых IP адресов"
cat $logfile | awk -F" " '{print $1}' | sort | uniq -c | sort -rn | head -n 10
echo''
echo''

#URL
echo "# Список  часто запрашиваемых URL"
cat $logfile | awk -F" " '{print $7}' | sort | uniq -c | sort -rn | head -n 10
echo''
echo''

#error
echo "# Список ошибок"
cat $logfile | awk -F" " '{print $9}' | egrep "^4|^5" | sort | uniq -c | sort -rn | head -n 10
echo''
echo''

#return codes
echo "# Список кодов возврата"
cat $logfile | awk -F" " '{print $9}' | egrep "^2|^3" | sort | uniq -c | sort -rn | head -n 10
echo''

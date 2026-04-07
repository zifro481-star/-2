#!/usr/bin/expect -f
set password "cD4aGX-Db_^*L+"
set timeout 120

spawn ssh root@83.217.201.60
expect "password:"
send "$password\r"
expect "#"

send "ls -la /var/www/html/\r"
expect "#"

send "cat /etc/nginx/sites-enabled/* 2>/dev/null || echo 'no sites'\r"
expect "#"

send "which python3\r"
expect "#"

send "which certbot || echo 'certbot not found'\r"
expect "#"

interact

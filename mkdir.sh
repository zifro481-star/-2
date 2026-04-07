#!/usr/bin/expect -f
set timeout 180
set password "cD4aGX-Db_^*L+"

spawn ssh root@83.217.201.60 "mkdir -p /var/www/lideryprava"
expect "password:"
send "$password\r"
expect "#"
send "exit\r"
expect eof

#!/usr/bin/expect -f
set password "cD4aGX-Db_^*L+"
set timeout 60

spawn scp nginx_lideryprava.conf lideryprava.service root@83.217.201.60:/tmp/
expect "password:"
send "$password\r"
expect eof

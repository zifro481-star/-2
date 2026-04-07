#!/usr/bin/expect -f
set password "cD4aGX-Db_^*L+"
set timeout 120

spawn ssh root@83.217.201.60
expect "password:"
send "$password\r"
expect "#"

send "certbot --nginx -d lideryprava.ru -d www.lideryprava.ru --register-unsafely-without-email --agree-tos\r"
expect "#"

send "systemctl status lideryprava\r"
expect "#"

interact

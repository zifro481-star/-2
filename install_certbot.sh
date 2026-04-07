#!/usr/bin/expect -f
set password "cD4aGX-Db_^*L+"
set timeout 180

spawn ssh root@83.217.201.60
expect "password:"
send "$password\r"
expect "#"

send "apt-get update && apt-get install -y certbot python3-certbot-nginx\r"
expect "#"
send "y\r"
expect "#"

send "certbot --nginx -d lideryprava.ru -d www.lideryprava.ru --register-unsafely-without-email --agree-tos\r"
expect "#"

interact

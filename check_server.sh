#!/usr/bin/expect -f
set password "cD4aGX-Db_^*L+"
set timeout 60

spawn ssh root@83.217.201.60
expect "password:"
send "$password\r"
expect "#"

send "ls -la /var/www/lideryprava/\r"
expect "#"

send "ls -la /var/www/lideryprava/data/\r"
expect "#"

send "systemctl status lideryprava\r"
expect "#"

send "curl -s http://127.0.0.1:8000/ | head -20\r"
expect "#"

send "ls -la /etc/nginx/sites-enabled/\r"
expect "#"

interact

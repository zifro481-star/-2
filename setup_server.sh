#!/usr/bin/expect -f
set password "cD4aGX-Db_^*L+"
set timeout 120

spawn ssh root@83.217.201.60
expect "password:"
send "$password\r"
expect "#"

send "mv /tmp/nginx_lideryprava.conf /etc/nginx/sites-available/lideryprava.conf\r"
expect "#"

send "ln -sf /etc/nginx/sites-available/lideryprava.conf /etc/nginx/sites-enabled/lideryprava.conf\r"
expect "#"

send "nginx -t\r"
expect "#"

send "systemctl reload nginx\r"
expect "#"

send "mv /tmp/lideryprava.service /etc/systemd/system/\r"
expect "#"

send "systemctl daemon-reload\r"
expect "#"

send "systemctl enable lideryprava\r"
expect "#"

send "systemctl start lideryprava\r"
expect "#"

send "systemctl status lideryprava\r"
expect "#"

interact

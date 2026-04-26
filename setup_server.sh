#!/usr/bin/expect -f
set password "dt@1eAb+u4zjP7"
set timeout 120

spawn ssh root@72.56.9.90
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

send "systemctl status lideryprava --no-pager\r"
expect "#"

send "exit\r"
expect eof

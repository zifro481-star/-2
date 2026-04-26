#!/usr/bin/expect -f
set password "dt@1eAb+u4zjP7"
set timeout 120

spawn ssh root@72.56.9.90
expect "password:"
send "$password\r"
expect "#"

send "certbot --nginx -d lideryprava.ru -d www.lideryprava.ru --register-unsafely-without-email --agree-tos\r"
expect "#"

send "systemctl status lideryprava\r"
expect "#"

interact

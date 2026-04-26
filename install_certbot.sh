#!/usr/bin/expect -f
set password "dt@1eAb+u4zjP7"
set timeout 180

spawn ssh root@72.56.9.90
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

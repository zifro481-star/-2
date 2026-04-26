#!/usr/bin/expect -f
set password "dt@1eAb+u4zjP7"
set timeout 60

spawn scp nginx_lideryprava.conf lideryprava.service root@72.56.9.90:/tmp/
expect "password:"
send "$password\r"
expect eof

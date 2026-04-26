#!/usr/bin/expect -f
set password "dt@1eAb+u4zjP7"
set timeout 300

spawn scp -r index.html admin.html server.py run_server.sh cookies.html privacy.html terms.html legal.css assets root@72.56.9.90:/var/www/lideryprava/
expect "password:"
send "$password\r"
expect eof

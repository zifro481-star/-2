#!/usr/bin/expect -f
set password "cD4aGX-Db_^*L+"
set timeout 300

spawn scp -r index.html admin.html server.py run_server.sh cookies.html privacy.html terms.html legal.css assets data root@83.217.201.60:/var/www/lideryprava/
expect "password:"
send "$password\r"
expect eof

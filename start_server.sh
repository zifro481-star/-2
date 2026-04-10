#!/usr/bin/expect -f
set password "cD4aGX-Db_^*L+"
set timeout 90

spawn ssh -o StrictHostKeyChecking=no -o PreferredAuthentications=password -o PubkeyAuthentication=no root@83.217.201.60
expect -re "(?i)password:"
send "$password\r"
expect -re {[$#] ?$}

send "systemctl restart lideryprava\r"
expect -re {[$#] ?$}

send "sleep 2\r"
expect -re {[$#] ?$}

send "curl -s http://127.0.0.1:8000/api/session\r"
expect -re {[$#] ?$}

send "exit\r"
expect eof

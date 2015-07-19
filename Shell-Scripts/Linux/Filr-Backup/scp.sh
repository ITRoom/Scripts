#!/usr/bin/expect -f

# remember: chmod 700 to protect sensitive data
# the first argument is the source full file name
# the second argument is the relative file name  for remote destination
# better if not root user is used for scp

set full_name [lindex $argv 0]
set file_name [lindex $argv 1]
send "FULL: $full_name\n"
send "FILE: $file_name\n"
# connect via scp
    send "\nExpect: tar filename $full_name\n"
    # Change scp users and password as needed. Change also destination host.
    spawn scp  $full_name "root@10.0.0.49:~/$file_name"
#######################
expect {
  -re ".*es.*o.*" {
    exp_send "yes\r"
    exp_continue
    }
  -re ".*sword.*" {
    exp_send "root\r"
    }
  }
interact

Novell Filr doesn’t have backup procedures. The documentation shows what directories to save (https://www.novell.com/documentation/novell-filr1/filr1_admin/data/ble2mdl.html).

Filr doesn’t store users data except for external users when personal storage are enabled so, in some cases,  saving only the configuration maybe sufficient.

For the backup, normally I use Amanda, but in this case I didn’t want to add software, so I used two scripts to collect data and store them in a remote server, where backups are configured and active.

The procedures are very simple and can be improved. The mysql data are stored via mysqldump into a compressed file. This file and other directory are stored in tar file end moved on remote server via scp.

For scp authentication I preferred the use of expect’s scripts, instead of manage certificates.

Of course, users names and password are exposed on script, so is very important to remove read permission for anyone except for root (chmod 700).

For scp, on the example, I’ve used root user, but on the production environment, for security reasons, another user was used.

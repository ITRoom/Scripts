#/bin/sh
# Remember: chmod 700 to protect sensitive data 

# backup folders 
# /vastorage/filr/filerepository
#     filr's file repository
# /varstorage/conf
#     From Novell documentation, this is the storage of  Lucene Search Index,
#     but i'm not sure. Here I've found only certs
# There are some echo for debug. This lines can be deleted or changed
# The output can be redirected to a log file
#
DATE=`/bin/date '+%Y%m%d'`
echo $DATE

OUT_FNAME="Filr_bk_$DATE.tar"
FULL_FNAME="/tmp/$OUT_FNAME"
echo -e "\nsave into $FULL_FNAME"

# dump of mysql db /on /varstorage/mysql
# change mysql users and password as needed
mysqldump --opt --all-database -uroot -proot | gzip -c > /tmp/filr.sql.gz

# Now tar
cd /vastorage

echo -e "\ntar -cf  $FULL_FNAME filr conf /tmp/filr.sql.gz\n"
tar -cf  $FULL_FNAME filr/filerepository conf /tmp/filr.sql.gz

# Call scp via expect
/usr/bin/expect -f /root/bin/scp_1.sh $FULL_FNAME $OUT_FNAME

# remove files
rm /tmp/filr.sql.gz
rm $FULL_FNAME

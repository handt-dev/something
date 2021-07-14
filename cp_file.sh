#!/bin/bash

HOST='10.72.69.69'
USER='admin'
PASSWD='123456'

DIR=$(dirname "$1")
SHARE_FILE=$(basename "$1")

cd $DIR

ftp -i -n $HOST << wait
user $USER $PASSWD

binary
put $SHARE_FILE
mv $SHARE_FILE frontend.tar
chmod 777 frontend.tar
quit
wait

cd - > /dev/null 2>&1

echo Finish copying file $1 to $HOST


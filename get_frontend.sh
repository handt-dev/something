#!/bin/bash

HOST='10.72.101.69'
USER='admin'
PASSWD='123456'

DIR=$(dirname "$1")
SHARE_FILE=$(basename "$1")

cd $DIR

ftp -i -n $HOST << wait
user $USER $PASSWD

binary
get $SHARE_FILE

quit
wait
mv $SHARE_FILE frontend.tar
chmod 777 frontend.tar
cd - > /dev/null 2>&1

echo Finish copying file $1 from $HOST and change name to frontend.tar


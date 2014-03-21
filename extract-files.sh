#!/bin/sh

VENDOR=lge
DEVICE=p760
DIRECTORY=/home/artur/Pulpit/v20b/2013-03-16.08.45.39

BASE=../../../vendor/$VENDOR/$DEVICE/proprietary
rm -rf $BASE/*

for FILE in `cat proprietary-files.txt | grep -v ^# | grep -v ^$`; do
    DIR=`dirname $FILE`
    if [ ! -d $BASE/$DIR ]; then
        mkdir -p $BASE/$DIR
    fi
    cp $DIRECTORY/system/$FILE $BASE/$FILE
done

./setup-makefiles.sh

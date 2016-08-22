#!/bin/sh

FILENAME=/home/fri/fessbox/backend-node/log/debug.log
SUFFIX=`date '+%Y.%m.%d-%H'`

if [ -s $FILENAME-$SUFFIX ]
        then
          sms=`/usr/bin/grep -cF "sms_in" $FILENAME-$SUFFIX`
          calls=`/usr/bin/grep -cF "from ring to master" $FILENAME-$SUFFIX`
          echo "{\"incoming_sms\":$sms,\"incoming_calls\":$calls}"
        else echo "{\"incoming_sms\":0,\"incoming_calls\":0}"
fi


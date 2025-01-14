#!/bin/bash

echo Enter script address
read SCRIPT_ADDRESS

echo Enter redeem script
read REDEEM_SCRIPT

echo Enter private key in hex format
read PRIVATE_KEY

echo Enter destination address - bitcoins will be sent to this address
read DEST_ADDRESS

echo
echo ..............................................
echo Script address.........: $SCRIPT_ADDRESS
echo Redeem script..........: $REDEEM_SCRIPT
echo Destination address....: $DEST_ADDRESS
echo ..............................................
echo
echo Do you want to redeem this coins from coredao network and send to destination address?
echo Type YES to continue
read CONFIRM


if [ $CONFIRM = "YES" ]
then
    node dist/index.js redeem --account $SCRIPT_ADDRESS --privatekey $PRIVATE_KEY --redeemscript $REDEEM_SCRIPT --destaddress $DEST_ADDRESS
fi


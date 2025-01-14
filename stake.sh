#!/bin/bash

echo Enter account address
read ACCOUNT

echo Enter private key in hex format
read PRIVATE_KEY

echo Enter amount in satoshi
read AMOUNT_SAT

echo Enter lock time in unix timestamp sec
read LOCK_TIME

LOCK_TIME_DATETIME=`date -d @$LOCK_TIME`

echo Enter reward address
read REWARD_ADDRESS

echo Enter validator address
read VALIDATOR_ADDRESS

FILE_NAME="stake-`date +%Y%m%d%H%M%S`.txt"


echo
echo ..............................................
echo Amount satoshi....: $AMOUNT_SAT
echo Address...........: $ACCOUNT
echo Lock time unix ts.: $LOCK_TIME
echo Lock time normal..: $LOCK_TIME_DATETIME
echo Reward address....: $REWARD_ADDRESS
echo Validator address.: $VALIDATOR_ADDRESS
echo File name.........: $FILE_NAME
echo ..............................................
echo
echo Do you want to stake this coins in coredao network?
echo Type YES to continue
read CONFIRM


if [ $CONFIRM = "YES" ]
then
    node dist/index.js stake --account $ACCOUNT --privatekey $PRIVATE_KEY --amount $AMOUNT_SAT  --locktime $LOCK_TIME --rewardaddress $REWARD_ADDRESS --validatoraddress $VALIDATOR_ADDRESS --witness > $FILE_NAME
    cat $FILE_NAME
fi


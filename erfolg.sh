#!/bin/bash

## Configuration -- Set the Path to the Directories
ORDNER1="/PATH/TO/Bitcoin-Stealer/Linux"
DATEI1="Success.txt"
ORDNER2="/PATH/TO/Ethereum-Stealer/Linux"
DATEI2="Success.txt"
PROTOKOLLDATEI="/PATH/TO/protocol.log"
## Create a protocol.log file in a directory of your choice and set the path to "PROTOKOLLDATEI"

## DO NOT TOUCH - This is the Checkup for the protocol 
pruefeOrdner() {
    local ordner=$1
    local datei=$2
    local zeitstempel=$(date '+%Y-%m-%d %H:%M:%S')
    if [ -f "$ordner/$datei" ]; then
        nachricht="$zeitstempel - $datei found in $ordner"
    else
        nachricht="$zeitstempel - $datei not found in $ordner"
    fi
    echo "$nachricht" | tee -a $PROTOKOLLDATEI
}

## console clear function - DO NOT TOUCH
loescheKonsole() {
    clear
}

## Main Loop - This gives an output to your console, that you dont have to check the protocol file each time. 
## This refreshes every 60 seconds and should not set below 60 seconds, because it creates more work load
while true; do
    loescheKonsole
    echo "Checking for files..."
    echo "------------------------"
    pruefeOrdner $ORDNER1 $DATEI1
    pruefeOrdner $ORDNER2 $DATEI2
    echo "------------------------"
    echo "Next refresh in 60 seconds..."
    sleep 60
    ## Set the sleep timer to a value of your choice, but keep in mind that too many refreshes create more work load
done

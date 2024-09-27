#!/bin/bash

## Konfiguration
ORDNER1="/home/pipi/Bitcoin-Stealer/Linux"
DATEI1="Success.txt"
ORDNER2="/home/pipi/Ethereum-Stealer/Linux"
DATEI2="Success.txt"
PROTOKOLLDATEI="/home/pipi/protocol.log"

## Funktion zur Prüfung eines Ordners
pruefeOrdner() {
    local ordner=$1
    local datei=$2
    local zeitstempel=$(date '+%Y-%m-%d %H:%M:%S')
    if [ -f "$ordner/$datei" ]; then
        nachricht="$zeitstempel - $datei gefunden in $ordner"
    else
        nachricht="$zeitstempel - $datei nicht gefunden in $ordner"
    fi
    echo "$nachricht" | tee -a $PROTOKOLLDATEI
}

## Funktion zum Löschen der Konsole
loescheKonsole() {
    clear
}

## Hauptschleife
while true; do
    loescheKonsole
    echo "Dateiprüfung läuft..."
    echo "------------------------"
    pruefeOrdner $ORDNER1 $DATEI1
    pruefeOrdner $ORDNER2 $DATEI2
    echo "------------------------"
    echo "Nächste Prüfung in 60 Sekunden..."
    sleep 60
done

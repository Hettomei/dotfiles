#!/bin/bash

if [ $# -lt 2 ]
then
  echo "Need to be run like this"
  echo "./notify.sh 3600 'Va manger'"
  echo "Aide"
  echo "600   -> 0h10"
  echo "1200  -> 0h20"
  echo "1800  -> 0h30"
  echo "2400  -> 0h40"
  echo "3000  -> 0h50"
  echo "3600  -> 1h00"
  echo "5400  -> 1h30"
  echo "7200  -> 2h00"
  echo "9000  -> 2h30"
  echo "10800 -> 3h00"
  echo "12600 -> 3h30"
  echo "14400 -> 4h00"
  echo "16200 -> 4h30"
  exit 1
fi

echo "Demande de sleep pour $1 secondes ($(($1/60)) minutes), avec le message $2"

sleep $1


while :
do
  echo "$2"
  notify-send PART "$2, jobs : $$"
  sleep 6
done

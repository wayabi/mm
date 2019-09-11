#!/bin/sh
while [ 1 ]
do
  if [ -e "./mm" ]; then
    echo "############### start #################"
    rm -f ./mm
    mm
    echo "###############  end  #################"
  fi
  sleep 1
done

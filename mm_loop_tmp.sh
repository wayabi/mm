#!/bin/sh

while [ 1 ]
do
  sleep 1
	mm_path=`cat /tmp/mm_path`
	if [ -z ${mm_path} ]; then
		continue
	fi
	
	cd ${mm_path}
  if [ -e "./mm" ]; then
    echo "############### start #################"
    rm -f ./mm
    mm
    echo "###############  end  #################"
  fi
done

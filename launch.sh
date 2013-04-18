#!/bin/bash

if [ ! -f /var/redis/conf/instances/instances.txt ]; then
  echo "No instances found. Please run create.sh."
	exit 1
fi

INSTANCES="`cat /var/redis/conf/instances/instances.txt`"

if [ -z "$INSTANCES" ]; then
	echo "No instances found. Please run create.sh."
	exit 1
fi

if [ -n "$1" ]; then
	INSTANCES=$1
fi

echo -e "\nLaunching Redis instances:\n"
	
for INSTANCE in $INSTANCES
do	
	echo -e "\t$INSTANCE"
	/usr/local/bin/redis-server /var/redis/conf/instances/$INSTANCE/conf
done

# A little housekeeping...
rm -f log

echo -e "\nDone launching Redis instances.\n"

exit 0

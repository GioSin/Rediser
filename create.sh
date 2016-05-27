#!/bin/bash

[ -z "$1" -o -z "$2" ] && echo -e "\nUsage: create.sh \e[4minstance_name\e[0m \e[4mport_number\e[0m\n" && exit 1

INSTANCE=$1
PORT=$2

# Ensure instances directory exists
mkdir -p /var/redis/conf/instances

# Copy default Redis config into /var/redis/conf
cp redis-default.conf /var/redis/conf/redis.conf

# Move to instances directory
cd /var/redis/conf/instances

# Ensure the new instance name directory does not exist to avoid duplicates in the instances list
if [ -d $INSTANCE ]; then
	echo -e "\nInstance already exists. Please provide unique instance name and port.\n"
	exit 1
fi

echo -e "\nCreating new Redis instance for $INSTANCE:\n"

echo -e "\tAdding instance name to instances list.\n"

echo $INSTANCE >> instances.txt

# Create and enter new instance name directory
mkdir -p $INSTANCE
cd $INSTANCE

echo -e "\tCreating config file for $INSTANCE instance with port $PORT."

########## DO NOT TOUCH LINES BELOW ##########
echo -e "### Include default Redis configuration.

include /var/redis/conf/redis.conf

### App-specific Redis settings.

dir /var/redis/conf/instances/$INSTANCE/
port $PORT" > conf
########## DO NOT TOUCH LINES ABOVE ##########

echo "alias redislog='less /var/redis/conf/instances/$INSTANCE/log'" >> /root/.bash_profile

echo -e "\nDone creating new Redis instance.\n"

exit 0

#!/bin/bash
# This script is meant to be run in the User Data of an EC2 Instance while it's booting.
# It starts a ggz web app.
# This script assumes it is running in an AMI built from the Packer template
# in https://github.com/go-ggz/packer/blob/master/ggz.json.

set -e

# Send the log output from this script to user-data.log, syslog, and the console
# From: https://alestic.com/2010/12/ec2-user-data-output/
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

HOME="/home/ubuntu"

# echo "${instance_text}" > index.html
# nohup busybox httpd -f -p "${instance_port}" &

# get docker-compose file
wget https://raw.githubusercontent.com/go-ggz/ggz/master/docker-compose.yml -O $HOME/docker-compose.yml

# start mysql db and minio service
docker-compose -f $HOME/docker-compose.yml up -d db minio
sleep 5

# start ggz service
docker-compose -f $HOME/docker-compose.yml up -d ggz

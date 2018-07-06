#!/bin/bash
# This script is meant to be run in the User Data of an EC2 Instance while it's booting.
# It starts a ggz web app.
# This script assumes it is running in an AMI built from the Packer template
# in https://github.com/go-ggz/packer/blob/master/ggz.json.

echo "${instance_text}" > index.html
nohup busybox httpd -f -p "${instance_port}" &

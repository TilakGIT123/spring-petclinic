#!/bin/bash
set -e -x
sudo yum update -y
sudo yum install -y python2.7
sudo yum install python3 -y
sudo yum install python -y
sudo yum install python-minimal -y
sudo pip install boto3
sudo pip install boto --user

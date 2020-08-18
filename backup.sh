#!/bin/bash

DATE=$(date +%H-%M)

HOST_NAME=$1
DB_PASSWORD=$2
DB_NAME=$3

AWS_ACCESS_KEY_ID=$4
AWS_SECRET_ACCESS_KEY=$5

echo "AWS_key_id= $AWS_ACCESS_KEY_ID"

echo "AWS_SECRET_ACCESS_KEY= $AWS_SECRET_ACCESS_KEY"

echo "hostName= $HOST_NAME"

mysqldump -u root -h $HOST_NAME -p$DB_PASSWORD $DB_NAME > /tmp/backup-$DATE.sql



export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID

export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY

echo "uploading db backup data till time $DATE"

aws s3 cp /tmp/backup-$DATE.sql s3://sebin-jenkins-mysql-backup/backup-$DATE.sql
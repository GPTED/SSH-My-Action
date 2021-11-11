#!/bin/bash

PRIVATE_KEY=$1
HOST=$2
PORT=$3
USERNAME=$4
COMMAND=${@:5}

echo "$PRIVATE_KEY" > /root/.ssh/id_rsa
chmod 400 /root/.ssh/id_rsa

# SSH Config to allow new host without prompt + hide the warning
echo "LogLevel=Error" >> /root/.ssh/config
echo "StrictHostKeyChecking=accept-new" >> /root/.ssh/config

echo "========== Command =========="
ssh -p $PORT "$USERNAME@$HOST" $COMMAND
echo "============ End ============"

# Cleanup, just in case
rm /root/.ssh/id_rsa

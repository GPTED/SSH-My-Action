#!/bin/bash

set  -eu

SSH_PATH="$HOME/.ssh/"
ID_RSA="$SSH_PATH/id_rsa"
KNOWN_HOSTS="$SSH_PATH/known_hosts"
CMD_FILE="$HOME/t.sh"

if [ ! -d "$SSH_PATH" ]
then
  mkdir -p "$SSH_PATH"
fi
touch $KNOWN_HOSTS

echo "$INPUT_PRIVATE_KEY" > $ID_RSA

echo "$INPUT_CMD" > $CMD_FILE
echo "exit \$?" >> $CMD_FILE

echo "prepare shell content:"
cat $CMD_FILE

chmod 700 $SSH_PATH
chmod 600 $ID_RSA
chmod 600 $KNOWN_HOSTS

# SSH Config to allow new host without prompt + hide the warning
echo "LogLevel=Error\nStrictHostKeyChecking=accept-new" > $HOME/.ssh/config

echo "========== Command =========="
ssh -vvv -i $ID_RSA -p $INPUT_PORT "${INPUT_USER}@${INPUT_HOST}" < $CMD_FILE
echo "============ End ============"

# Cleanup, just in case
rm $ID_RSA

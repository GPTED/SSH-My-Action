#!/bin/bash

set  -eu

SSH_PATH="$HOME/.ssh"
ID_RSA="$SSH_PATH/id_rsa"
KNOWN_HOSTS="$SSH_PATH/known_hosts"
CMD_FILE="$HOME/t.sh"

if [ ! -d "$SSH_PATH" ]
then
  mkdir -p "$SSH_PATH"
fi
touch $KNOWN_HOSTS

echo "$INPUT_PRIVATE_KEY" > "$ID_RSA"

echo $INPUT_CMD > $CMD_FILE
echo "exit \$?" >> $CMD_FILE

echo "prepare shell content:"
cat $CMD_FILE

chmod 700 $SSH_PATH
chmod 600 $ID_RSA
chmod 600 $KNOWN_HOSTS

echo "========== Command =========="
ssh -vvv -T -i $ID_RSA -o StrictHostKeyChecking=no -p $INPUT_PORT $INPUT_USER@$INPUT_HOST "bash -s" < $CMD_FILE $GITHUB_REPOSITORY $GITHUB_REF_NAME
echo "============ End ============"

# Cleanup, just in case
rm $ID_RSA

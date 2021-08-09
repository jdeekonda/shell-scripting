#!/bin/bash
read -p "Please enter new username:" USER_NAME
if [ -z "$USER_NAME" ]; then
  echo "You have entered empty string"
else
  EX_USER=$(cat /etc/passwd | cut -d ":" -f 1 | grep -w $USER_NAME)
  if [ "$EX_USER" = "$USER_NAME" ]; then
    echo "User $USER_NAME already exists"
  else
    echo "Starting user creation....."
    echo "Generating Random password"
    SPEC=$(echo '!@#(^$*_%' | fold -w1 | shuf | head -1)
    PASSWORD="Shell${RANDOM}$SPEC"
    useradd -m $USER_NAME
    echo "$USER_NAME:$PASSWORD" | sudo chpasswd
    echo "User password is $PASSWORD, Pls change password at first signin"
    passwd -e "$USER_NAME"
  fi
fi
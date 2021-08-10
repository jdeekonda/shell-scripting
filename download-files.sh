#!/bin/bash
read -p "Enter download URL :" URL
wget $URL
if [ $? -eq 0 ]
then
  echo "File downloaded and installed successfully."
  ls -al
else
  echo "Invalid download URL !!"
fi
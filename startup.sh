#!/bin/bash

echo "If you want to ban a host, please write the host as follow"
echo "example.com"
echo "if not just press enter"

while true
  do read hostbanned
   if [ -z $hostbanned ]
    then break
    else echo ".$hostbanned" >> /etc/squid/forbidden.lst
   fi
done

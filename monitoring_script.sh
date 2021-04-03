#!/usr/bin/bash


address="https://simple-vm.shiny-infra.xyz/"
pattern="Hello my name is Michalina. Friends call me Mishka though."

if curl -s --output mail.txt $address | grep -q "$pattern";
then
  exit 0
else
  (echo "Subject: Simple VM is down";  echo;  echo "There are errors in Alert log of $address: $(cat mail.txt)") | sendmail notify@mismail.xyz
fi

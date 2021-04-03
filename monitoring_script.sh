#!/usr/bin/bash


address="https://simple-vm.shiny-infra.xyz/"
pattern="Hello my name is Michalina. Friends call me Mishka though."

output_file=/tmp/mail.txt

if curl -s --output $output_file $address | grep -q "$pattern";
then
  exit 0
else
  (echo "Subject: Simple VM is down";  echo;  echo "There are errors in Alert log of $address: $(cat $output_file)") | sendmail notify@mismail.xyz
fi

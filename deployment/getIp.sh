#!/bin/bash
public_ip=`terraform output -json ip_address | jq -r '.[0]'`
sed -i "s/IP_ADDRESS/$public_ip/" hosts

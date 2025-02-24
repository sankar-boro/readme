#!/usr/bin/env bash

KILL_PROGRAM=$(sudo lsof -i -P -n | grep LISTEN | grep "sear" | awk '{ print $2 }')

a=0;

for i in ${KILL_PROGRAM[@]}; do
sudo kill -9 $i
done

# BLA=$(sudo lsof -i -P -n | grep LISTEN | grep "validator" | awk '{ print $2 }')

# a=0;

# for i in ${BLA[@]}; do
# sudo kill -9 $i
# done
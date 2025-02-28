#!/bin/bash

names=("sankar" "arun" "rakhi" "priya")
# Array and for loop
loop() {
  for name in $@; do
    echo $name
  done
}
# loop ${names[@]}

# While loop
whileLoop() {
  args=$@
  count=0
  while [ $count -le ${#args[@]} ]; do
    echo ${args[$count]}
    ((count++))  # increment counter
  done
}
# whileLoop ${names[@]}

# # Find
# find ./bash -name "*.md"
# find ./bash -type f -size +1c   

find ./bash/advanced.md -type f -exec grep "files" {} \;
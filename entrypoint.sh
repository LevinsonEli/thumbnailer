#!/bin/bash

TN_SIZE=${TN_SIZE:-150}

#for file in /pics/*; do
for file in /project/examples/*; do
  if [ -f "$file" ]; then
    /project/thumbnail.sh "$file" -s "$TN_SIZE"
  fi
done

ls -alF /project/examples

#!/bin/bash

# read our templates
dircolors=$(<.dircolors)

# now read our colors
while read -r line; do
  if [ "$line" != "" ] && [ "${line:0:1}" != "#" ]; then
    name=$(echo $line | cut -d ' ' -f 1)
    value=$(echo $line | cut -d ' ' -f 2)
    dircolors=$(echo "$dircolors" | sed -e "s/{$name}/$value/g" -)
  fi
done < colors

dircolors=$(echo "$dircolors" | dircolors - | head -1)
echo "export $dircolors" > .lscolors

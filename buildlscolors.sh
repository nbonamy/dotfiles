#!/bin/bash

# read our templates
dircolors=$(<.dircolors)

# now read our colors
while read -r line; do
  if [ "$line" != "" ] && [ "${line:0:1}" != "#" ] && [ "${line:0:1}" != "." ]; then
    line=$(echo $line | cut -d '#' -f 1)
    name=$(echo $line | cut -d ' ' -f 1)
    value=$(echo $line | cut -d ' ' -f 2)
    dircolors=$(echo "$dircolors" | sed -e "s/{$name}/$value/g")
  fi
done < colors

# dir color program
if dircolors > /dev/null 2>&1; then
  dircolor=dircolors
else # OS X
  dircolor=$(brew --prefix)/opt/coreutils/libexec/gnubin/dircolors
fi

# final export
echo "# DO NOT EDIT - Use buildlscolors.sh to generate" > .lscolors
echo "$dircolors" | $dircolor - >> .lscolors

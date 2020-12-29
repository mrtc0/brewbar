#!/bin/bash

IFS=$'\n'
json=$(/usr/local/bin/brew outdated --json=v2)

count=$(echo $json | /usr/local/bin/jq -r '(.formulae | length) + (.casks | length)')

if [ $count -eq 0 ]; then
  echo ":beer:"
else
  echo ":beer: :warning: | color=red"
fi
echo "---"
echo ":warning: Outdated packages (${count})"

for line in $(echo $json | /usr/local/bin/jq -r '.formulae[] | .name + " (" + (.installed_versions | join(",")) + " -> " + .current_version + ")"'); do
  echo "--${line}"
done

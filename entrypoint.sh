#!/bin/sh

config_files=$1

printf 'Config files:\n%s\n' "$config_files"

if [ -z "$config_files" ]; then
  mkdocs build
else
  IFS=$'\n'
  for config_file in $config_files; do
    echo "- $config_file"
    mkdocs build --config-file "$config_file"
  done
fi

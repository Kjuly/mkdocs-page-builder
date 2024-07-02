#!/bin/sh

requirements_file=$1
config_files=$2

printf 'Requirements file: %s\n' "$requirements_file"
printf 'Config files:\n%s\n' "$config_files"

# shellcheck source=/dev/null
. "$(dirname "$0")/.venv/bin/activate"

if [ -n "$requirements_file" ]; then
  if [ -f "$requirements_file" ]; then
    pip install -r "$requirements_file"
  else
    printf '::ERROR:: Invalid requirements_file: %f\n' "$requirements_file"
  fi
fi

if [ -z "$config_files" ]; then
  mkdocs build
else
  IFS="$(printf '\n\b')"
  for config_file in $config_files; do
    echo "- $config_file"
    mkdocs build --config-file "$config_file"
  done
fi

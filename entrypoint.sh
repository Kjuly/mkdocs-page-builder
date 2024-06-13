#!/bin/sh

config_files=$1

printf 'Config files:\n%s\n' "$config_files"

# shellcheck source=/dev/null
if [ -z "$GITHUB_ACTION_PATH" ]; then
  . .venv/bin/activate
else
  . "$GITHUB_ACTION_PATH/.venv/bin/activate"
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

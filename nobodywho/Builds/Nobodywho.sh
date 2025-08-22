#!/bin/sh
echo -ne '\033c\033]0;Nobodywho\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/Nobodywho.x86_64" "$@"

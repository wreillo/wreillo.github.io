#!/usr/bin/env bash
set -e
slug="$1"
if [ -z "$slug" ]; then
  echo "Usage: ./new-post.sh <slug-name>"
  exit 1
fi
mkdir -p "posts/$slug"
cp posts/_template/index.qmd "posts/$slug/index.qmd"
echo "Created posts/$slug/index.qmd — edit title/date/categories, drop in a featured image, then run 'quarto preview'"

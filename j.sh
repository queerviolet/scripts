#!/bin/bash
if [ -n "$*" ]; then
  title=$(echo "_$*" | sed -e 's/ /_/g')
fi
export jot="$(date '+%Y-%m-%d %H:%M:%S (%Z)')$title.md"
echo "# $jot" > "$jot"
echo "$jot"
open -a Emacs "$jot"


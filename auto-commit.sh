#!/bin/bash
REPO="/Users/xavier/Library/Mobile Documents/com~apple~CloudDocs/natasha"

cd "$REPO" || exit 1

# Check if there are any changes (staged, unstaged, or untracked)
if [ -n "$(git status --porcelain)" ]; then
    git add -A
    git commit -m "auto-commit: $(date '+%Y-%m-%d %H:%M:%S')"
    git push origin master
fi

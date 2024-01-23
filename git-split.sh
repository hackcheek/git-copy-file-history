#!/bin/sh

if [[ $# -ne 2 ]] ; then
  echo "Usage: git-split.sh <file> <copy-file>"
  exit 0
fi

git mv $1 $2
git add $2
git commit -m "Rename: $1 -> $2"
git branch temp-git-split
git reset HEAD~1 --soft
git mv $2 temp-git-split-file
git commit -m "Rename: $1 -> temp-git-split-file"
git merge temp-git-split
git add temp-git-split-file
git add $2
git rm $1
git commit -m "Merging history"
git branch -d temp-git-split
git mv temp-git-split-file $1
git commit -m "Rename: temp-git-split-file -> $1"

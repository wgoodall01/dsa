#!/usr/bin/env bash

export ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../" && pwd )"
source "$ROOT/scripts/config.sh"
# $ORG  = the github org
# $ROOT = the project root

if [[ ! "$1" ]]; then
	echo "add.sh: no repo specified"
	exit 1
else
	repo="$1"
fi

repo_url="git@github.com:$ORG/$repo.git" 
repo_path="src/$repo"

echo "Adding '$repo_url'..."
cd $ROOT
git stash &&\
	git submodule add "$repo_url" "$repo_path" &&\
	git submodule update &&\
	echo "Added submodule." &&\
	git add "$repo_path" &&\
	git commit -m "[add]: $repo" 

git stash pop


#!/bin/bash

GOVERNOR=$1
REPO_NAME=$2

if [ -z $1 -a -z $2 ]
then
	echo "Usage: `basename $0` torvalds linux"

curl https://api.github.com/repos/$GOVERNOR/$REPO_NAME/pulls?state=all 1> ./pull_requests.json

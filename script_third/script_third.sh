#!/bin/bash

GOVERNOR=$1
REPO_NAME=$2

if [ "$#" -lt 2 ]
then
	echo "Usage: `basename $0` repo_maintainer repo_name"
	exit 1
fi

NUMBER_OPEN_PRS=$(curl https://api.github.com/repos/$GOVERNOR/$REPO_NAME/pulls?state=all 2> /dev/null |
jq -jr '.[] | "PR_state:", " ",.state, "\n","contributor_name:", (.user|" ",.login), "\n", "label:", (.head | " ",.label), "\n"' |
awk 'ORS=NR%3?" ":"\n"' |
grep "open" |
wc -l)

if [ "$NUMBER_OPEN_PRS" = 0 ]
then
	echo "There are no open pull requests"
	exit 1
else
	echo "Number of open pull requests is "$NUMBER_OPEN_PRS""
fi

CONTRIBUTORS_LABELS_PRS=$(curl https://api.github.com/repos/$GOVERNOR/$REPO_NAME/pulls?state=all 2> /dev/null |
#jq -jr '.[] | "state:", " ",.state, "\n","name:", (.user|" ",.login), "\n"' |
jq -jr '.[] | "PR_state:", " ",.state, "\n","contributor_name:", (.user|" ",.login), "\n", "label:", (.head | " ",.label), "\n"' |
awk 'ORS=NR%3?" ":"\n"' |
grep "open" |
sort |
uniq -c |
awk '{if($1 > 1) print $5,", " $6, $7, ", number of open PRs:", $1}')

if [ -z "$CONTRIBUTORS_LABELS_PRS"  ]
then
	echo "There are no contributors with 2 or more open PRs"
	exit 1
else
	echo "Contributors with more than 1 open pull request with labels:"
	echo "$CONTRIBUTORS_LABELS_PRS"
	exit 0
fi

#!/bin/bash

GOVERNOR=$1
REPO_NAME=$2

if [ $# -lt 2 ]
then
	echo "Usage: `basename $0` repo_maintainer repo_name"
	exit 1
fi

#curl https://api.github.com/repos/$GOVERNOR/$REPO_NAME/pulls?state=all 1> ./pull_requests.json 2> /dev/null
NUMBER_OPEN_PRS=$(curl https://api.github.com/repos/$GOVERNOR/$REPO_NAME/pulls?state=all 2> /dev/null |
jq -jr '.[] | "PR_state:", " ",.state, "\n","contributor_name:", (.user|" ",.login), "\n", "label:", (.head | " ",.label), "\n"' |
awk 'ORS=NR%3?" ":"\n"' |
grep "open" |
wc -l)
echo "Number of open pull requests is "$NUMBER_OPEN_PRS""

if [ -z "$NUMBER_OPEN_PRS" ]
then
	echo "There are no open pull requests"
	exit 1
fi

CONTRIBUTORS_LABELS_PRS=$(curl https://api.github.com/repos/$GOVERNOR/$REPO_NAME/pulls?state=all 2> /dev/null |
#jq -jr '.[] | "state:", " ",.state, "\n","name:", (.user|" ",.login), "\n"' |
jq -jr '.[] | "PR_state:", " ",.state, "\n","contributor_name:", (.user|" ",.login), "\n", "label:", (.head | " ",.label), "\n"' |
awk 'ORS=NR%3?" ":"\n"' |
grep "open" |
sort |
uniq -c |
awk '{if($1 > 0) print $5,", " $6, $7, ", number of open PRs:", $1}')
echo "Contributors with more than 1 open PR:"
echo "$CONTRIBUTORS_LABELS_PRS"

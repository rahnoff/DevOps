# GitHub PRs checking script

The script accepts two params **repo_maintainer** and **repo_name**. GitHub API returns JSON with info about pull requests

`jq -jr '.[] | "PR_state:", " ",.state, "\n","contributor_name:", (.user|" ",.login), "\n", "label:", (.head | " ",.label), "\n"'` - prints from JSON file only **state**, **login**, **label** fields of each pull request
`awk 'ORS=NR%3?" ":"\n"'` - formats one column into three ones
`grep "open"` - prints only lines with word **open**
`wc -l` - counts number of lines

#!/bin/bash

. tests/assert.sh -v

src="./git-quick-stats"
assert "$src fail" "Invalid argument

NAME
    git-quick-stats - Simple and efficient way to access various stats in a git repo

SYNOPSIS
    For non-interactive mode: git-quick-stats [OPTIONS]
    For interactive mode: git-quick-stats

DESCRIPTION
    Any git repository contains tons of information about commits, contributors,
    and files. Extracting this information is not always trivial, mostly because
    of a gadzillion options to a gadzillion git commands.

    This program allows you to see detailed information about a git repository.

OPTIONS
    -r, --suggest-reviewers
        show the best people to contact to review code
    -T, --detailed-git-stats
        give a detailed list of git stats
    -R, --git-stats-by-branch
        see detailed list of git stats by branch
    -d, --commits-per-day
        displays a list of commits per day
    -m, --commits-by-month
        displays a list of commits per month
    -w, --commits-by-weekday
        displays a list of commits per weekday
    -o, --commits-by-hour
        displays a list of commits per hour
    -A, --commits-by-author-by-hour
        displays a list of commits per hour by author
    -a, --commits-per-author
        displays a list of commits per author
    -S, --my-daily-stats
        see your current daily stats
    -C, --contributors
        see a list of everyone who contributed to the repo
    -b, --branch-tree
        show an ASCII graph of the git repo branch history
    -D, --branches-by-date
        show branches by date
    -c, --changelogs
        see changelogs
    -L, --changelogs-by-author
        see changelogs by author
    -j, --json-output
        save git log as a JSON formatted file to a specified area
    -h, -?, --help
        display this help text in the terminal

ADDITIONAL USAGE
    You can set _GIT_SINCE and _GIT_UNTIL to limit the git time log
        ex: export _GIT_SINCE=\"2017-01-20\"
    You can set _GIT_LIMIT for limited output log
        ex: export _GIT_LIMIT=20
    You can set _GIT_LOG_OPTIONS for git log options
        ex: export _GIT_LOG_OPTIONS=\"--ignore-all-space --ignore-blank-lines\"
    You can exclude directories or files from the stats by using pathspec
        ex: export _GIT_PATHSPEC=':!pattern'
    You can set _GIT_MERGE_VIEW to view merge commits with normal commits
        ex: export _GIT_MERGE_VIEW=enable
    You can also set _GIT_MERGE_VIEW to only show merge commits
        ex: export _GIT_MERGE_VIEW=exclusive
    You can set _MENU_THEME to display the legacy color scheme
        ex: export _MENU_THEME=legacy"

assert_raises "$src fail" 1

assert_contains "$src --suggest-reviewers" "Suggested code reviewers (based on git history)"
assert_raises "$src --suggest-reviewers" 0

assert_contains "$src --detailed-git-stats" "Contribution stats"
assert_raises "$src --detailed-git-stats" 0

assert_contains "$src --commits-per-day" "Git commits per date"
assert_raises "$src --commits-per-day" 0

assert_end

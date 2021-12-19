#!/bin/sh

git filter-branch --env-filter 'if [ "$GIT_AUTHOR_EMAIL" = "trong.duong@codelink.io" ]; then
     GIT_AUTHOR_EMAIL=princ3od@gmail.com;
     GIT_AUTHOR_NAME="Trong Duong Binh";
     GIT_COMMITTER_EMAIL=$GIT_AUTHOR_EMAIL;
     GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"; fi' -- --all
#!/bin/bash
# usage: ./02_init_github_repo.sh git@github.com:my-organization/my-repo.git

if [ $# -eq 0 ]
  then
    echo "repository SSH URL is not ptovided"
    exit
fi

REPO=$1

git config --global user.email "$USER_LOGIN-$TASK_ID@example.com"
git config --global user.name "$USER_LOGIN"
git config --global init.defaultBranch "main"


git init && \
git add . && \
git commit -m "first commit" && \
git branch -M main && \
git remote add origin $REPO && \
git push -u origin main

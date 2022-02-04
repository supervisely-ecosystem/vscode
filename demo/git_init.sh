#!/bin/bash

# helpFunction()
# {
#    echo ""
#    echo "Usage: $0 -repo parameterA "
#    echo -e "\t-repo link to github repo"
#    echo -e "\t-b Description of what is parameterB"
#    echo -e "\t-c Description of what is parameterC"
#    exit 1 # Exit script after printing help
# }

# while getopts "a:b:c:" opt
# do
#    case "$opt" in
#       a ) parameterA="$OPTARG" ;;
#       b ) parameterB="$OPTARG" ;;
#       c ) parameterC="$OPTARG" ;;
#       ? ) helpFunction ;; # Print helpFunction in case parameter is non-existent
#    esac
# done

git init && \
git add . && \
git commit -m "first commit" && \
git branch -M master && \
git remote add origin git@github.com:supervisely-ecosystem/delme.git && \
git push -u origin master
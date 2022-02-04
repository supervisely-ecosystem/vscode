#!/bin/bash

# template from here: https://gist.github.com/neatshell/5283811

script="02_init_github_repo.sh"
#Declare the number of mandatory args
margs=1

# Common functions - BEGIN
function example {
    echo -e "example: $script -r git@github.com:my-organization/my-repo.git"
}

function usage {
    echo -e "usage: $script -r VAL"
}

function help {
  usage
    echo -e "MANDATORY:\n"
    echo -e "  -r, --repo  VAL  use github SSH URL, for example 'git@github.com:<organization>/<repo>.git'\n"
    
  example
}

# Ensures that the number of passed args are at least equals
# to the declared number of mandatory args.
# It also handles the special case of the -h or --help arg.
function margs_precheck {
	if [ $2 ] && [ $1 -lt $margs ]; then
		if [ $2 == "--help" ] || [ $2 == "-h" ]; then
			help
			exit
		else
	    	usage
			example
	    	exit 1 # error
		fi
	fi
}

# Ensures that all the mandatory args are not empty
function margs_check {
	if [ $# -lt $margs ]; then
	    usage
	  	example
	    exit 1 # error
	fi
}
# Common functions - END

# Custom functions - BEGIN
# Put here your custom functions
# Custom functions - END

# Main
margs_precheck $# $1

marg0=

# Args while-loop
while [ "$1" != "" ];
do
   case $1 in
   -r  | --repo )  shift
                          marg0=$1
                		  ;;
   -h   | --help )        help
                          exit
                          ;;
   *)                     
                          echo "$script: illegal option $1"
                          usage
						  example
						  exit 1 # error
                          ;;
    esac
    shift
done

# Pass here your mandatory args for check
margs_check $marg0

# Your stuff goes here


echo "!!! max !!!"

# git config --global user.email "$USER_LOGIN-$TASK_ID@example.com"
# git config --global user.name "$USER_LOGIN"

# git init && \
# git add . && \
# git commit -m "first commit" && \
# git branch -M master && \
# git remote add origin git@github.com:supervisely-ecosystem/delme.git && \
# git push -u origin master
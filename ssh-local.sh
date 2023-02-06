#!/bin/bash
ENV_FILENAME='.env.ssh.local'
FULL_PATH="$PWD/$ENV_FILENAME"
RED='\e[0;31m'
NC='\e[0m' # No Color
YELLOW='\e[4;33m'
# Help --------------------------------------------------------------------------------------------
if [ "$1" == "--help" ]; then
  echo -e "This program helps to use ssh with different environments"
  echo -e "You must specify environments in $ENV_FILENAME\n"
  echo -e "Usage: "
  echo -e "ssh-local $YELLOW""environment1$NC\n"
  echo -e "$YELLOW$ENV_FILENAME$NC content example: "
  echo -e "environment1=\"ssh -p 777 user@server.domain\""
  echo -e "environment2=\"ssh -p 8471 user2@server2.domain2\"\n"
  echo -e "Keys: "
  echo -e "$YELLOW""--list$NC -> show current environments"
  echo -e "$YELLOW""--help$NC -> see this tip"
  exit
fi
# -------------------------------------------------------------------------------------------------

# Environment list --------------------------------------------------------------------------------
if [ "$1" == '--list' ]; then
  if [ -f "$FULL_PATH" ]; then
    cat "$FULL_PATH" | cut -f1 -d"="
  else
    echo -e "$RED""Cant found $YELLOW$ENV_FILENAME$RED in current directory$NC"
  fi
  exit
fi
# -------------------------------------------------------------------------------------------------

if [ -f "$FULL_PATH" ]; then
  if [ -z "$1" ]; then
    echo -e "$RED""You must specify environment to connect. Example: $NC""ssh-local $YELLOW""dev$NC"
    exit;
  fi
  source "$FULL_PATH"
    if [ -z "${!1}" ]; then
      echo -e "$YELLOW$1$RED environment is not specified in $YELLOW$FULL_PATH$RED env file$NC"
      echo -e "You must add next line to $YELLOW$FULL_PATH$NC file: \n"
      echo -e "$1=\"ssh --parameters user@server.ip.or.domain\""
      exit
    fi

    gnome-terminal --tab -- ${!1}
else
  echo -e "$RED""Cant found $YELLOW$ENV_FILENAME$RED in current directory$NC"
fi

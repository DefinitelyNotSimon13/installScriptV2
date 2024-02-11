#! /bin/bash

confirmYN(){
  if [ ! -z "$1" ]; then
    msg="$1"
  else
    msg="Are you sure?"
  fi
  read -r -p "$msg [y/N] " response
  if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
  then
    return 0
  else
    return 1
  fi
}

enterToContinue(){
  if [ -n "$1" ]; then
    msg="$1"
  else
    msg="Press enter to continue..."
  fi
  read -r -p "$msg"
}


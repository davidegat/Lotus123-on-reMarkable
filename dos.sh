#!/bin/bash

reset(){
  SCENE=("@fontsize 32")
}
add(){
  echo "Adding: @$*"
  SCENE+=("@$*")
}
ui(){
  echo "Adding: $*"
  SCENE+=("$*")
}
display(){
  IFS=$(echo -en "\n\b")
  script=$(for line in ${SCENE[@]}; do echo $line; done)
  IFS=" "
  RESULT=$(echo ${script} | /opt/bin/simple)
}
yaft /home/root/startdos.sh
reset
add timeout 1
display

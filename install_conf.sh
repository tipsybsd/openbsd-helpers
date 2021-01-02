#!/bin/sh

for conf in `ls conf`
do

  #backup existing file
  if [ -f ~/.${conf} ] && [ ! -h ~/.${conf} ]
  then
    echo "--> backing up ${conf}"
    mv ~/.${conf} ~/${conf}_backup
  fi

  #make symlink
  if [ ! -h ~/.${conf} ] && [ -f conf/${conf} ]
  then
    echo "--> linking ${conf}"
    ln -s proj/openbsd-helpers/conf/${conf} ~/.${conf}
  fi

done

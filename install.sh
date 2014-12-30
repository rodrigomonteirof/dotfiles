#!/bin/bash

files=( bash_profile vimrc )

for filename in ${files[@]}
do
[[ -s $HOME/.$filename ]] && rm -rf $HOME/.$filename
  ln -sfi $PWD/$filename ~/.$filename
done

source ~/.bash_profile

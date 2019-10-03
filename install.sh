#!/bin/bash

files=( vimrc zshrc )

for filename in ${files[@]}
do
[[ -s $HOME/.$filename ]] && rm -rf $HOME/.$filename
  ln -sfi $PWD/$filename ~/.$filename
done

#!/bin/bash

# make sure config files exist
touch ~/.zshrc
touch ~/.bashrc

# source versioned sh's
sourceSh () {
  sourceCommand="source ~/.my_sh/$1"
  targetFile=~/$1

  if ! grep -Fxq "$sourceCommand" $targetFile
  then
    echo "$sourceCommand" >> $targetFile
  fi
}

sourceSh '.zshrc'
sourceSh '.bashrc'






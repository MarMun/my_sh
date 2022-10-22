#!/bin/bash

# source versioned sh's
sourceSh () {
  sourceCommand="source ~/.my_sh/$1"
  targetFile=~/$1

  # make sure target file exist
  touch $targetFile

  if ! grep -Fxq "$sourceCommand" $targetFile
  then
    echo "$sourceCommand" >> $targetFile
  fi
}

sourceSh '.zshrc'
sourceSh '.bashrc'






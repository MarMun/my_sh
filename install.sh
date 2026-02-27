#!/bin/bash

# source versioned sh's
sourceSh() {
  sourceCommand="source ~/.my_sh/$1"
  targetFile=~/$1

  # make sure target file exist
  touch $targetFile

  # only add source command if not already present
  if ! grep -Fxq "$sourceCommand" $targetFile; then
    echo "$sourceCommand" >>$targetFile
  fi
}

sourceSh '.zshrc'
sourceSh '.bashrc'

# Handle tmux.conf (copy example if not exists, then symlink)
if [ ! -f ~/.tmux.conf ]; then
  if [ -f ~/.my_sh/.tmux.conf.example ]; then
    cp ~/.my_sh/.tmux.conf.example ~/.my_sh/.tmux.conf
    ln -s ~/.my_sh/.tmux.conf ~/.tmux.conf
    echo "Created ~/.tmux.conf -> ~/.my_sh/.tmux.conf"
  fi
fi

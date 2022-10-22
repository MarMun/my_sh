#! /bin/bash

sourceZsh='source ~/.my_sh/.zshrc'
sourceBash='source ~/.my_sh/.bashrc'

if ! grep -Fxq "$sourceZsh" ~/.zshrc
then
  echo 'source ~/.my_sh/.zshrc' >> ~/.zshrc
fi

if ! grep -Fxq "$sourceBash" ~/.bashrc
then
  echo 'source ~/.my_sh/.bashrc' >> ~/.bashrc
fi


#!/bin/bash

alias config='/usr/bin/git --git-dir=$HOME/src/dotFiles/ --work-tree=$HOME'
zsh -c config config --local status.showUntrackedFiles no

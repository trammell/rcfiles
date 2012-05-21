#!/bin/bash

mkdir -p ~/work/github
cd ~/work/github
git clone git@github.com:trammell/rcfiles.git
make -C ~/work/github/rcfiles install


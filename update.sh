#!/bin/bash
cd ~/.vim/bundle
for path in ./*; do
   cd $path
   pwd
   git pull origin master
   cd ..
done

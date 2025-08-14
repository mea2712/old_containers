#!bin/bash

git init
echo "*.gz" >> .gitignore
echo "*.tar" >> .gitignore

git add .
git commit -m "initial commit excluding .gz files"

git remote add origin https://github.com/mea2712/old_containers.git
git push -u origin main


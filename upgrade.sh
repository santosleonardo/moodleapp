#!/bin/bash

# Script to rebase master branch

# Adiciona upstream do repositorio oficial

if [ $(git remote | grep upstream | wc -l) -eq 0 ]
then
    git remote add upstream https://github.com/moodlehq/moodlemobile2.git
fi

git fetch upstream

git checkout master
git rebase upstream/master
git push origin master

git checkout avpmobile
git merge master
#! /bin/bash

value=$(<./ListRepos)

for i in $value; do
  git clone $i &
done
wait
echo "Finish clone all repositories in file ListRepos"

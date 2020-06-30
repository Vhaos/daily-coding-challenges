#!/usr/bin/env bash

echo "Updating repos : "
echo "git pull origin master"

git pull origin master

echo "Updating theme submodule : "
echo "git submodule foreach git pull origin master"

git submodule foreach git pull origin master
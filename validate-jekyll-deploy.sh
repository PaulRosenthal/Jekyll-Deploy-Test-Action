#!/bin/sh -l

# The $1 variable contains the location of the gemfile. By default, this is the root of the repository
# and is equal to /github/workspace.
cd /github/workspace/$1 && echo "Changed directory to `pwd`"
sudo bundle install
# The $2 variable contains the location of the Jekyll website. By default, this is the root of the repository
# and is equal to /github/workspace.
cd /github/workspace/$2 && echo "Changed directory to `pwd`"
if jekyll build --verbose ; then
  echo "The test build completed successfully."
  echo "Present working directory: " && pwd
  echo "List of files/folders: " && ls
  exit 0
else
  echo "The test build failed."
  exit 1
fi

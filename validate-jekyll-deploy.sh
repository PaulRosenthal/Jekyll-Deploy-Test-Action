#!/bin/sh -l

# The $1 variable contains the location of the gemfile. By default, this is the root of the repository
# and is equal to /github/workspace.
cd /github/workspace/$1 && echo "Changed directory to `pwd`"
sudo bundle install
# The $2 variable contains the location of the Jekyll website. By default, this is the root of the repository
# and is equal to /github/workspace.
cd /github/workspace/$2 && echo "Changed directory to `pwd`"
echo "The current Ruby version is: " && ruby -v
if jekyll build --verbose ; then
  echo "The test build completed successfully."
  exit 0
else
  echo "The test build failed."
  exit 1
fi

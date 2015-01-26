#! /bin/bash

shared_dir="/vagrant"
user_home="/home/vagrant"
user_name="vagrant"

# Keep the command history.
touch "$shared_dir/.bash_history"
ln -sf "$shared_dir/.bash_history $user_home/.bash_history"
chown --no-dereference $user_name:$user_name "$shared_dir/.bash_history" "$user_home/.bash_history"

# Installs the only Python package we should need.
apt-get update
apt-get -y install `cat $shared_dir/vm/apt-packages.txt|egrep -v "#"`

if [ $? -ne 0 ]; then
    echo "Aptitude failed."; exit 6
fi

# Making the Node.js bin available where most of its packages expect it to be.
ln -sf "/usr/bin/nodejs" "/usr/bin/node" # Ubuntu.

# Node.js dependencies.
cd $shared_dir
# @todo Vagrant fails when using package.json
npm install -g `cat $shared_dir/vm/npm-packages.txt|egrep -v "#"`
npm install

if [ $? -ne 0 ]; then
    echo "NPM failed."; exit 7
fi

# Update Webdriver
webdriver-manager update

if [ $? -ne 0 ]; then
    echo "WebDriver update failed."; exit 9
fi

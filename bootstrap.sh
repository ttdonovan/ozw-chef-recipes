#!/usr/bin/env bash

apt-get update
gem install chef --no-ri --no-rdoc
mkdir -p /usr/git
mkdir -p /etc/chef
echo 'cookbook_path "/cookbooks"' > /etc/chef/solo.rb
echo '{
  "run_list": ["recipe[thrift]"]
}' > /etc/chef/node.json

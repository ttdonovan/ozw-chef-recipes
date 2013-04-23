#
# Cookbook Name:: thrift4ozw
# Recipe:: default
#
# Copyright (C) 2013 Tanner Donovan
# 
# MIT
#

git 'checkout Thrift4OZW code' do
  repository 'git://github.com/ekarak/Thrift4OZW.git'
  reference 'master'
  action :checkout
  destination '/usr/git/Thrift4OZW'
  not_if { ::File.exists?('/usr/git/Thrift4OZW') }
end

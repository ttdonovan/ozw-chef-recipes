#
# Cookbook Name:: thrift4ozw
# Recipe:: default
#
# Copyright (C) 2013 Tanner Donovan
# 
# MIT
#

execute 'create src dir' do
  command 'mkdir -p /usr/src'
  not_if { ::File.exists?('/usr/src') }
end

git 'checkout Thrift4OZW code' do
  repository 'git://github.com/ekarak/Thrift4OZW.git'
  reference 'master'
  action :checkout
  destination '/usr/src/Thrift4OZW'
  not_if { ::File.exists?('/usr/src/Thrift4OZW') }
end

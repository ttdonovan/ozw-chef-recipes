#
# Cookbook Name:: open-zwave
# Recipe:: default
#
# Copyright (C) 2013 Tanner Donovan
# 
# MIT
#

%w{
  libudev-dev
  subversion
}.each do |pkg|
  package pkg
end

execute 'create svn dir' do
  command 'mkdir -p /usr/svn'
  not_if { ::File.exists?('/usr/svn') }
end

execute 'checkout Open ZWave code' do
  cwd '/usr/svn'
  command <<-EOF
    (svn checkout http://open-zwave.googlecode.com/svn/trunk/ open-zwave-read-only)
  EOF
  not_if { ::File.exists?('/usr/svn/open-zwave-read-only') }
end

execute 'make Open ZWave' do
  cwd '/usr/svn/open-zwave-read-only/debian'
  command <<-EOF
    (ln -s ../cpp cpp) &&
    (make)
  EOF
end
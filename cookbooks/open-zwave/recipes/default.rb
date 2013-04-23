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

execute 'create src dir' do
  command 'mkdir -p /usr/src'
  not_if { ::File.exists?('/usr/src') }
end

execute 'checkout Open ZWave code' do
  cwd '/usr/src'
  command <<-EOF
    (svn checkout http://open-zwave.googlecode.com/svn/trunk/ open-zwave-read-only)
  EOF
  not_if { ::File.exists?('/usr/src/open-zwave-read-only') }
end

execute 'make Open ZWave' do
  cwd '/usr/src/open-zwave-read-only/debian'
  command <<-EOF
    (ln -s ../cpp cpp) &&
    (make)
  EOF
end

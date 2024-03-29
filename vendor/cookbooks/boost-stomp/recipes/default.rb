#
# Cookbook Name:: boost-stomp
# Recipe:: default
#
# Copyright (C) 2013 Tanner Donovan
#
# MIT
#

include_recipe 'stompserver'

%w{
    libboost1.42-all-dev
    libboost-system1.42.0
    libboost-system1.42-dev
    libboost-thread1.42.0
    libboost-thread1.42-dev }.each do |pkg|
  package pkg
end

execute 'create git dir' do
  command 'mkdir -p /usr/git'
  not_if { ::File.exists?('/usr/git') }
end

git 'checkout BoostStomp code' do
  repository 'git://github.com/ekarak/BoostStomp.git'
  reference 'master'
  action :checkout
  destination '/usr/git/BoostStomp'
  not_if { ::File.exists?('/usr/git/BoostStomp') }
end

execute 'build BoostStomp' do
  cwd '/usr/git/BoostStomp'
  command <<-EOF
    (make) &&
    (make install)
  EOF
end

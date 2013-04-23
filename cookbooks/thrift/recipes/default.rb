#
# Cookbook Name:: thrift
# Recipe:: default
#
# Copyright (C) 2013 Tanner Donovan
#
# MIT
#

include_recipe 'build-essential'

%w{ libtool libqt4-dev qt4-qmake cmake r-base-dev libcurl4-gnutls-dev }.each do |pkg|
  package pkg
end

git 'checkout thrift code' do
  repository 'https://git-wip-us.apache.org/repos/asf/thrift.git'
  reference 'master'
  action :checkout
  destination '/usr/git/thrift'
  not_if { ::File.exists?('/usr/local/bin/thrift') }
end

# FIXME: address the `build thrift` erros
# thift `make && make install` returns errors
# but everything seems to have compiled fine
execute 'build thrift' do
  cwd '/usr/git/thrift'
  command <<-EOF
    (./bootstrap.sh) &&
    (./configure #{node[:thrift][:configure_options].join(' ')}) &&
    (make) &&
    (make install)
  EOF
  not_if { ::File.exists?('/usr/local/bin/thrift') }
end

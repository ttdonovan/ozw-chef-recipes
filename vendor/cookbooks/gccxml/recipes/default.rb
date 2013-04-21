#
# Cookbook Name:: gccxml
# Recipe:: default
#
# Copyright (C) 2013 Tanner Donovan
# 
# MIT
#

package 'gccxml'

# mongrel
%w{
  gccxml_gem
  rspec
  bit-struct
  onstomp
}.each do |pkg|
  gem_package pkg
end

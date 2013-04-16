include_recipe 'build-essential'

%w{ libqt4-dev qt4-qmake cmake r-base-dev libcurl4-gnutls-dev }.each do |pkg|
  package pkg
end

git 'checkout thrift code' do
  repository 'https://git-wip-us.apache.org/repos/asf/thrift.git'
  reference 'master'
  action :checkout
  destination '/usr/git/thrift'
  not_if { ::File.exists?('/usr/local/bin/thrift') }
end

execute 'build thrift' do
  cwd '/usr/git/thrift'
  command <<-EOF
    (./bootstraph.sh) &&
    (./configure #{node[:thrift][:configure_options].join(' ')})
    (make install)
  EOF
  not_if { ::File.exists?('/usr/local/bin/thrift') }
end

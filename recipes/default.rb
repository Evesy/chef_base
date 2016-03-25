#
# Cookbook Name:: chef_base
# Recipe:: default
#
# Copyright 2016, Mike Eves
#
# All rights reserved - Do Not Redistribute
#

# Install a bunch of packages I like to have
%w(bind-utils mlocate nmap ruby ruby-devel).each do |pkg|
    package pkg do
        action :install
    end
end

# Move SSH port to something more obscure
template '/etc/ssh/sshd_config' do
    source 'sshd_config.erb'
    owner 'root'
    group 'root'
    mode '0600'
    notifies :restart, 'service[sshd]'
    notifies :run, 'execute[semanage]', :immediately
end

execute 'semanage' do
    command "semanage port -a -t ssh_port_t -p tcp #{node['ssh']['port']}"
    action :nothing
end

service 'sshd' do
    action :nothing
end
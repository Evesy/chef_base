#
# Cookbook Name:: chef_base
# Recipe:: selinux
#
# Copyright 2016, Mike Eves
#
# All rights reserved - Do Not Redistribute
#

# Change SELinux state (and reboot if changed)
template '/etc/selinux/config' do
  source 'selinux_config.erb'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :reboot_now, 'reboot[selinux_change]', :immediately
end

reboot 'selinux_change' do
  action :nothing
  reason 'Server needs rebooting when SELinux becomes enforcing from disabled'
end
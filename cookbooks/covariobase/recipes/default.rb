#
# Cookbook Name:: covariobase
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "apt" 
include_recipe "chef-client::cron" 
include_recipe "ntp"
include_recipe "timezone-ii"
include_recipe "users"
include_recipe "sshd"

users_manage "sysadmin" do
  group_id 111
  group_name "admin"
  action [ :remove, :create]
end

openssh_server '/etc/ssh/sshd_config' do
  Port 22
  PasswordAuthentication 'yes'
  UsePrivilegeSeparation 'yes'
  KeyRegenerationInterval 3600
  ServerKeyBits 768
  LogLevel 'INFO'
  LoginGraceTime 120
  PermitRootLogin 'yes'
  StrictModes 'yes'
  RSAAuthentication 'yes'
  PubkeyAuthentication 'yes'
  X11Forwarding 'yes'
  X11DisplayOffset 10
  PrintLastLog 'yes'
  TCPKeepAlive 'yes'
end

bash "create_ssh_keys" do
  user "root"
  group "root"
  cwd "/tmp"
  code <<-EOH
  /usr/bin/ssh-keygen -t rsa -f ~/.ssh/id_rsa -N ''
  cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
  chmod 600 ~/.ssh/authorized_keys
  EOH
end

#
# Cookbook Name:: covariobase
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "apt" 
include_recipe "chef-client" 
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
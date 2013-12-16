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

users_manage "admin" do
  group_id = 111
  action [ :remove, :create]
end
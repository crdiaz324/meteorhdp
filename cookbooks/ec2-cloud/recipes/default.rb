#
# Cookbook Name:: ec2-cloud
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#
#Knife invocations supply FQDN as the node name at creation time and this becomes hostname( option -N)

execute "Configure Hostname" do
  command "hostname -F /etc/hostname"
end

#Ensure the hostname of the system is set to knife provided node name
file "/etc/hostname" do
  content node.name
  notifies :run, resources(:execute => "Configure Hostname"), :immediately
end
 
#This sets up script which will run whenever eth0 comes up(after reboot) to update /etc/hosts
cookbook_file "/etc/network/if-up.d/update_hosts" do
        source "update_hosts.sh"
        owner "root"
        group "root"
        mode 0555
        backup false
end
 
#Execute this script now (firsttime) to set /etc/hosts to have the newly provisioned nodes address/hostname line
 
bash "update_hosts" do
  user "root"
  group "root"
  cwd "/tmp"
  code <<-EOH
  export IFACE=eth0
  /etc/network/if-up.d/update_hosts
  EOH
end


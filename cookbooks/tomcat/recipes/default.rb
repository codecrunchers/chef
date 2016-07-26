#
# Cookbook Name:: tomcat
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

user "tomcat" do
  shell "/bin/bash"
  system true
  action :create
end

directory 'App Deps' do
  owner 'tomcat'
  group 'users'
  mode '0755'
  action :create
  path "#{node[:tomcat][:dest]}"
  recursive true
end

bash "install_tomcat" do
  user "tomcat"
  cwd "/repos"
  code <<-EOH
    tar -zxf #{node[:tomcat][:src]} -C  #{node[:tomcat][:dest]}
  EOH
end

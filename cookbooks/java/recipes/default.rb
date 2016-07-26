#
# Cookbook Name:: java
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
bash "install_java" do
  not_if "/usr/bin/java -version | grep -q '#{node[:java][:version]}'"
  user "root"
  cwd "/repos"
  code <<-EOH
    tar -zxf #{node[:java][:src]} -C  'jdk-#{node[:java][:version]}'
    (mkdir #{node[:java][:dest]}/ && mv  'jdk-#{node[:java][:version]}' #{node[:java][:dest]})
  EOH
end

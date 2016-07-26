#
# Cookbook Name:: apm
# Recipe:: Version
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
template '/etc/opt/version.info' do
  source 'version.info.erb'
  action :create
  mode '0755'
  group 'root'
  owner 'root'
  variables(
    :app_name => node[:apm][:app_name],
    :app_version => node[:apm][:app_version],
    :app_git_repo => node[:apm][:app_git_repo],
    :app_install_date => node[:apm][:app_install_date]
  )
end

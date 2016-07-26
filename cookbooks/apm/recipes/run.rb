#
# Cookbook Name:: apm::run
#
# Recipe:: Version
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#

bash "run_tomcat" do
  user "tomcat"
  cwd "/apps"
  code <<-EOH
  export JAVA_HOME=/apps/jdk1.8.0_101/
  apache-tomcat-8.0.36/bin/./catalina.sh start
  while true; do sleep 1; done
  EOH
end


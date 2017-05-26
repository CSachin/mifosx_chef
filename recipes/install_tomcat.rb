#
# Cookbook:: mifosx
# Recipe:: install_tomcat
#
# Copyright:: 2017, The Authors, All Rights Reserved.

# 5. Install tomcat
packages = node['mifosx']['tomcat']['packages']

package packages do
  action :install
  notifies :restart, "service[#{packages[0]}]", :immediately
end

service packages[0] do
  action :start
end

# 6. Enable ssl in tomcat





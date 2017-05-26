#
# Cookbook:: .
# Recipe:: initialize
#
# Copyright:: 2017, The Authors, All Rights Reserved.

# 1. Update the apt package
apt_update

# 2. sudo apt-get install python-software-properties
apt_package 'python-software-properties' do
  action :install
end

#
# Cookbook:: mifosx
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

# Steps to be carried out
# Check the System Requirements 
# Support only Ubuntu for any other platform just dont execute
# 1. Update the apt package
# 2. sudo apt-get install python-software-properties
# 3. Install Oracle JDK 8
# 4. Install mysql with root password set to mysql
# 5. Install tomcat
# 6. Enable ssl in tomcat
# 7. Update the server.xml configuration
# 8. Download drizzle jdbc connector
# 9. Download mysql jdbc connector
# 10. Configure the tomcat start behavior
# 11. Download and extract  Fineract Platform
# 12. Initialize mysql data
# 13. Activate Mifos
# 14. Restart Tomcat

# Future Steps
# Configure nginx load balancer to mifos


# Support only Ubuntu for any other platform just dont execute

raise "This recipe is not supported in current platform #{node['platform']}. Run it in ubuntu" if node['platform'] != 'ubuntu'

include_recipe 'mifosx::initialize'
#include_recipe 'mifosx::java'
include_recipe 'java_se'
include_recipe 'mifosx::install_my_sql'
include_recipe 'mifosx::install_tomcat'
include_recipe 'mifosx::fineract_platform'


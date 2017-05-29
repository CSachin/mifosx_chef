#
# Cookbook:: .
# Recipe:: fineract_platform
#
# Copyright:: 2017, The Authors, All Rights Reserved.

# 11. Download and extract  Fineract Platform
remote_file '/var/tmp/fineractplatform-16.03.03.RELEASE.zip' do
  source 'https://sourceforge.net/projects/mifos/files/Mifos%20X/fineractplatform-16.03.03.RELEASE.zip'
  action :create
end
# 12. Initialize mysql data
#mysql -S /var/run/mysql-foo/mysqld.sock
bash 'create database 1' do
  code <<-EOF
  echo 'create database mifosplatform-tenants;' | /usr/bin/mysql -u root -h 127.0.0.1 -P 3306 -pmysql;
  touch /tmp/salmonmarker
  EOF
  not_if 'test -f /tmp/salmonmarker'
  action :run
end
#create database `mifostenant-default`;

bash 'create database 2' do
  code <<-EOF
  echo 'create database mifostenant-default;' | /usr/bin/mysql -u root -h 127.0.0.1 -P 3306 -pmysql;
  touch /tmp/salmonmarker1
  EOF
  not_if 'test -f /tmp/salmonmarker1'
  action :run
end


# 13. Activate Mifos
execute 'unzip the file' do
  command 'apt-get -y install unzip && cd /var/tmp && unzip /var/tmp/fineractplatform-16.03.03.RELEASE.zip '
  action :run
  only_if { !::File.exist?('/var/tmp/fineractplatform-16.03.03.RELEASE.zip') }
end

packages = node['mifosx']['tomcat']['packages']
execute 'unzip the file' do
  command 'cp /var/tmp/fineractplatform-16.03.03.RELEASE/fineract-provider.war /var/lib/tomcat7/webapps/fineract-provider.war && cp -r /var/tmp/fineractplatform-16.03.03.RELEASE/apps/community-app/ /var/lib/tomcat7/webapps/' 
  action :run
  only_if { !::File.exist?('/var/lib/tomcat7/webapps/fineract-provider.war') }
  notifies :restart, "service[#{packages[0]}]", :immediately
end







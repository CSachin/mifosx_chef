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
  action [:enable, :start]
end

# 6. Enable ssl in tomcat

execute 'Generate key store' do
  command 'keytool -genkey -keyalg RSA -alias tomcat -keystore /usr/share/tomcat.keystore'
  action :run
  only_if { !::File.exist?('/usr/share/tomcat.keystore') }
end

# 7. Update the server.xml configuration

cookbook_file '/etc/tomcat7/server.xml' do
  source 'server.xml'
  action :create
end

# 8. Download drizzle jdbc connector
remote_file '/usr/share/tomcat7/lib/drizzle-jdbc-1.3.jar' do
  source 'http://central.maven.org/maven2/org/drizzle/jdbc/drizzle-jdbc/1.3/drizzle-jdbc-1.3.jar'
  action :create
end


# 9. Download mysql jdbc connector zip
remote_file '/var/tmp/mysql-connector-java-5.1.42.tar.gz' do
  source 'https://cdn.mysql.com//Downloads/Connector-J/mysql-connector-java-5.1.42.tar.gz'
  action :create
end

bash 'untar' do
  code <<-EOF
  tar -xvf /var/tmp/mysql-connector-java-5.1.42.tar.gz;
  cp /var/tmp/mysql-connector-java-5.1.42/mysql-connector-java-5.1.42-bin.jar /usr/share/tomcat7/lib/mysql-connector-java-5.1.42-bin.jar
  EOF
  action :run
  only_if { !::File.exist?('/usr/share/tomcat7/lib/mysql-connector-java-5.1.42-bin.jar') }
end

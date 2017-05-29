# java attributes
default['java']['jdk_version'] = '8'
default['java']['install_flavor'] = 'oracle'
default['java']['oracle']['accept_oracle_download_terms'] = true
#default['java']['set_etc_environment'] = true

default['mifosx']['tomcat']['packages'] = ['tomcat7','tomcat7-docs','tomcat7-admin','tomcat7-examples','unzip']

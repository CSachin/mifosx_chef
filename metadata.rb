name 'mifosx_chef'
maintainer 'shaikkhajaibrahim'
maintainer_email 'shaik.khaja.ibrahim@live.in'
license 'All Rights Reserved'
description 'Installs/Configures mifosx'
long_description 'Installs/Configures mifosx'
version '0.1.0'
chef_version '>= 12.1' if respond_to?(:chef_version)

# The installation/setup is carried out based out of installation steps at
# https://mifosforge.jira.com/wiki/display/docs/Mifos+X+Installation+on+Linux+-+Ubuntu+Server


# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
 issues_url 'https://github.com/asquarezone/mifosx_chef/issues'

# The `source_url` points to the development reposiory for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
 source_url 'https://github.com/asquarezone/mifosx_chef'

depends 'mysql', '~> 8.3.1'
depends 'java_se', '~> 8.0'
depends 'database', '= 1.2.0'

supports 'ubuntu'

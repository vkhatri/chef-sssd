name              'sssd'
maintainer        'Virender Khatri'
maintainer_email  'vir.khatri@gmail.com'
license           'Apache 2.0'
description       'Installs/Configures sssd'
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           '0.1.0'

source_url        'https://github.com/vkhatri/chef-sssd' if respond_to?(:source_url)
issues_url        'https://github.com/vkhatri/chef-sssd/issues' if respond_to?(:issues_url)

depends           'apt'
depends           'yum'

%w(centos amazon).each do |os|
  supports os
end

depends 'sssd-test'

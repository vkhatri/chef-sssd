default['sssd']['disable_service'] = false
default['sssd']['conf_dir'] = '/etc/sssd'
default['sssd']['conf_file'] = ::File.join(node['sssd']['conf_dir'], 'sssd.conf')
default['sssd']['log_dir'] = '/var/log/sssd'
default['sssd']['packages'] = value_for_platform(
  %w(centos redhat fedora amazon) => { 'default' => %w(authconfig sssd autofs) },
  %w(debian ubuntu) => { 'default' => %w(sssd libsss-sudo0) }
)

# sssd databag to store bind_dn username and password
default['sssd']['data_bag']['name'] = 'sssd'
default['sssd']['data_bag']['item'] = 'bind_dn'
default['sssd']['data_bag']['username_key'] = 'username'
default['sssd']['data_bag']['password_key'] = 'password'

default['sssd']['ca_cert']['cookbook_name'] = nil
default['sssd']['ca_cert']['cookbook_file_name'] = nil
default['sssd']['ca_cert']['dir'] = '/etc/openldap/cacerts'

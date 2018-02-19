# [sssd] parameters
default['sssd']['config']['sssd']['config_file_version'] = 2
default['sssd']['config']['sssd']['services'] = %w(nss pam sudo ssh autofs)
default['sssd']['config']['sssd']['domains'] = %w()
default['sssd']['config']['sssd']['reconnection_retries'] = 3
default['sssd']['config']['sssd']['debug_level'] = 0

# service [nss] parameters
default['sssd']['config']['nss']['filter_users'] = %w(avahi dbus haldaemon named news nobody nscd radiusd root ec2-user centos ubuntu)
default['sssd']['config']['nss']['filter_groups'] = %w(root)
# default['sssd']['config']['nss']['enum_cache_timeout'] = 120
# default['sssd']['config']['nss']['filter_users_in_groups'] = true
# default['sssd']['config']['nss']['override_homedir'] = '/home/%u'
# default['sssd']['config']['nss']['fallback_homedir'] = '/home/%u'
# default['sssd']['config']['nss']['allowed_shells'] = nil
# default['sssd']['config']['nss']['vetoed_shells'] = nil
# default['sssd']['config']['nss']['shell_fallback'] = '/bin/bash'
# default['sssd']['config']['nss']['default_shell'] = '/bin/bash'
# default['sssd']['config']['nss']['get_domains_timeout'] = 60
# default['sssd']['config']['nss']['memcache_timeout'] = 60
# default['sssd']['config']['nss']['user_attributes'] = nil

# service [pam] parameters
# default['sssd']['config']['pam'] = nil
# default['sssd']['config']['pam']['debug_level'] = 0
# default['sssd']['config']['pam']['offline_credentials_expiration'] = 0
# default['sssd']['config']['pam']['offline_failed_login_attempts'] = 5
# default['sssd']['config']['pam']['offline_failed_login_delay'] =
# default['sssd']['config']['pam']['pam_verbosity'] = 1
# default['sssd']['config']['pam']['pam_id_timeout'] = 5
# default['sssd']['config']['pam']['pam_pwd_expiration_warning'] = 0
# default['sssd']['config']['pam']['get_domains_timeout'] = 60
# default['sssd']['config']['pam']['pam_trusted_users'] = nil
# default['sssd']['config']['pam']['pam_public_domains'] = nil
default['sssd']['config']['pam']['pam_account_expired_message'] = 'Account expired, please contact help desk'

# service [sudo] parameters
default['sssd']['config']['sudo'] = {}
# default['sssd']['config']['sudo']['sudo_timed'] = false

# service [autofs] parameters
default['sssd']['config']['autofs'] = {}
# default['sssd']['config']['autofs']['autofs_negative_timeout'] = 15

# service [ssh] parameters
default['sssd']['config']['ssh'] = {}
# default['sssd']['config']['ssh']['ssh_hash_known_hosts'] = true
# default['sssd']['config']['ssh']['ssh_known_hosts_timeout'] = 180
# https://www.redhat.com/archives/freeipa-users/2016-July/msg00290.html
# default['sssd']['config']['ssh']['ca_db'] = '/etc/pki/nssdb'

# service [pac] parameters
default['sssd']['config']['pac'] = {}
# default['sssd']['config']['pac']['allowed_uids'] = '0'

# man sssd-ldap
# [domain/] parameters
default['sssd']['config']['domains'] = {}

# [domain/ldapfoo] parameters, foo.foo -> dc=foo,dc=foo
# default['sssd']['domains']['ldapfoo'] = {
#  'min_id' =>  '1',
#  'max_id' =>  '0',
#	'enumerate' =>  'false',
#	'force_timeout' => 120,
#	'entry_cache_timeout' => '5400',
#	'cache_credentials' => 'false',
#	'account_cache_expiration' => 0,
#	'pwd_expiration_warning' => 0,
#	'id_provider' =>  'ldap',
#	'use_fully_qualified_names' => 'false',
#	'auth_provider' =>  'ldap',
#	'access_provider' =>  'ldap',
#	'chpass_provider' =>  'ldap',
#	'sudo_provider' => 'none',
#	'selinux_provider' => 'none',
#	'subdomains_provider' => 'ldap',
#	'autofs_provider' => 'ldap',
#  'cached_auth_timeout' => 0,
#	'hostid_provider' => 'none',
#
#  'ldap_uri' =>  'ldap://something.yourcompany.com',
#	'ldap_backup_uri' => '',
#
#	'ldap_chpass_uri' => '',
#	'ldap_chpass_backup_uri' => '',
#
#  'ldap_id_use_start_tls' =>  'true', #???
#  'ldap_tls_reqcert' =>  'hard',
#  'ldap_tls_cacert' => nil,
#  'ldap_tls_cacertdir' => nil, # default: use OpenLDAP defaults, typically in /etc/openldap/ldap.conf
#
#  'ldap_tls_cert' => nil,
#  'ldap_tls_key' => nil,
#  'ldap_tls_cipher_suite' => nil, # default : use OpenLDAP defaults, typically in /etc/openldap/ldap.conf
#
#	'ldap_schema' =>  'rfc2307bis',
#  'ldap_search_base' =>  'dc=foo,dc=foo',
#  'ldap_user_search_base' =>  'cn=users,cn=accounts,dc=foo,dc=foo',
#	'ldap_group_search_base' => 'cn=groups,cn=accounts,dc=foo,dc=foo',
#
#  'ldap_default_bind_dn' =>  'uid=USERNAME,cn=users,cn=accounts,dc=foo,dc=foo',
#  # move to recipes/attributes.rb
#  'ldap_default_authtok' =>  data_bag_item_key(node['sssd']['data_bag']['bind_dn']['name'], node['sssd']['data_bag']['bind_dn']['item'], node['sssd']['data_bag']['bind_dn']['password']),
#
#	'ldap_user_ssh_public_key' => nil, # ipaSshPubKey
#
#	'ldap_search_timeout' => 6,
#	'ldap_enumeration_search_timeout' => 60,
#	'ldap_network_timeout' => 6,
#	'ldap_opt_timeout' => 6,
#
# #  'ldap_user_search_filter' => '',
# #  'ldap_group_search_filter' => ''
#
# #  'override_homedir' =>  nil,
# #  'shell_fallback' =>  '/bin/bash',
# #	'fallback_homedir' => '/home/%u',
#
#  'ldap_access_filter' =>  '(&(|(memberOf=cn=ops,cn=groups,cn=accounts,dc=foo,dc=foo)(memberOf=cn=ops,cn=groups,cn=accounts,dc=foo,dc=foo))(!(nsaccountlock=TRUE)))',
#  'ldap_access_order' => 'ppolicy, filter, expire', # pwd_expire_policy_reject, pwd_expire_policy_warn, pwd_expire_policy_renew
#  'ldap_pwdlockout_dn' => nil, # "cn=ppolicy,ou=policies,dc=foo,dc=foo"
# }

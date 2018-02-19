#
# Cookbook Name:: sssd
# Recipe:: default
#
# Copyright 2017, Virender Khatri
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'mixlib/shellout'

# ldap ca cert file
cookbook_file 'ldap_ca_cert_file' do
  path ::File.join(node['sssd']['ca_cert']['dir'], node['sssd']['ca_cert']['cookbook_file_name'])
  cookbook node['sssd']['ca_cert']['cookbook_name']
  source node['sssd']['ca_cert']['cookbook_file_name']
  mode 0550
  notifies :run, 'execute[hash_ldap_ca_cert]'
end

## authconfig
# from https://bugzilla.redhat.com/show_bug.cgi?id=975082
ruby_block 'enabled_sss_sudoers_nsswitch' do
  block do
    edit = Chef::Util::FileEdit.new('/etc/nsswitch.conf')
    edit.insert_line_if_no_match(/^sudoers:/, 'sudoers: files')

    if node['sssd']['config']['sssd']['services'].include?('sudo')
      # Add sss to the line if it's not there.
      edit.search_file_replace(/^sudoers:([ \t]*(?!sss\b)\w+)*[ \t]*$/, '\0 sss')
    else
      # Remove sss from the line if it is there.
      edit.search_file_replace(/^(sudoers:.*)\bsss[ \t]*/, '\1')
    end

    edit.write_file
  end
end

# authconfig --enablemkhomedir
execute 'authconfig_enable_make_home_dir' do
  command "authconfig --enablemkhomedir  --update --nostart"
  not_if { Mixlib::ShellOut.new('grep -o USEMKHOMEDIR=yes /etc/sysconfig/authconfig').run_command.exitstatus == 0 }
end

# authconfig --enablesssd
execute 'authconfig_enable_sssd' do
  command "authconfig --enablesssd --update --nostart"
  not_if { Mixlib::ShellOut.new('grep -o USESSSD=yes /etc/sysconfig/authconfig').run_command.exitstatus == 0 }
end

# authconfig --enablesssdauth
execute 'authconfig_enable_sssd_auth' do
  command "authconfig --enablesssdauth --update --nostart"
  not_if { Mixlib::ShellOut.new('grep -o USESSSDAUTH=yes /etc/sysconfig/authconfig').run_command.exitstatus == 0 }
end

execute 'hash_ldap_ca_cert' do
  command "/usr/sbin/cacertdir_rehash #{node['sssd']['ca_cert']['dir']}"
  action :nothing
end

## sssd config
sssd_config = {
  'sssd' => node['sssd']['config']['sssd'],
  'nss' => node['sssd']['config']['nss'],
  'autofs' => node['sssd']['config']['autofs'],
  'ssh' => node['sssd']['config']['ssh'],
  'sudo' => node['sssd']['config']['sudo'],
  'pam' => node['sssd']['config']['pam'],
  'pac' => node['sssd']['config']['pac'],
  'ifp' => node['sssd']['config']['ifp'],
  'domains' => node['sssd']['config']['domains'],
  'services' => node['sssd']['config']['sssd']['services']
}

template node['sssd']['conf_file'] do
  source 'sssd.conf.erb'
  mode '0600'
  variables(sssd_config)
  helpers SssdCookbookHelper
  notifies :restart, 'service[sssd]'
end

ruby_block 'delay sssd service start' do
  block do
  end
  notifies :start, 'service[sssd]'
  not_if { node['sssd']['disable_service'] }
end

service_action = node['sssd']['disable_service'] ? %i[disable stop] : %i[enable nothing]

service 'sssd' do
  supports status: true, restart: true, reload: true
  action service_action
end

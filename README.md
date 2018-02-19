sssd Cookbook
================

[![Cookbook](https://img.shields.io/github/tag/vkhatri/chef-sssd.svg)](https://github.com/vkhatri/chef-sssd) [![Build Status](https://travis-ci.org/vkhatri/chef-sssd.svg?branch=master)](https://travis-ci.org/vkhatri/chef-sssd)

This is a [Chef] cookbook to manage SSSD.


>> For Production environment, always prefer the [most recent release](https://supermarket.chef.io/cookbooks/sssd).


## Most Recent Release

```ruby
cookbook 'sssd', '~> 1.0.0'
```


## From Git

```ruby
cookbook 'sssd', github: 'vkhatri/chef-sssd',  tag: 'v1.0.0'
```


## Repository

```
https://github.com/vkhatri/chef-sssd
```


## Supported OS

- Amazon Linux
- CentOS
- Ubuntu


## Supported Chef

- Chef 12
- Chef 13


## Cookbook Dependency

- apt
- yum


## Recipes

- `sssd::default` - run_list recipe

- `sssd::config` - configure sssd

- `sssd::install` - install sssd


## Attributes

* `default['sssd']['disable_service']` (default: `false`): if set true, disable sssd service

* `default['sssd']['conf_dir']` (default: `/etc/sssd`): sssd config directory

* `default['sssd']['conf_file']` (default: `calculated`): sssd config directory

* `default['sssd']['log_dir']` (default: `/var/log/sssd`): sssd log directory

* `default['sssd']['packages']` (default: `calculated`): sssd packages list

* `default['sssd']['ca_cert']['cookbook_name']` (default: `nil`): cookbook name for ca cert file

* `default['sssd']['ca_cert']['cookbook_file_name']` (default: `nil`): cookbook file name for ca cert file

* `default['sssd']['ca_cert']['dir']` (default: `/etc/openldap/cacerts`): certificates directory


## Config Attributes

* `default['sssd']['config']['sssd']['config_file_version']` (default: `2`): sssd section `sssd` parameter

* `default['sssd']['config']['sssd']['services']` (default: `[nss, pam, sudo, ssh, autofs)`): sssd section `sssd` parameter

* `default['sssd']['config']['sssd']['domains']` (default: `[]`): sssd section `sssd` parameter

* `default['sssd']['config']['sssd']['reconnection_retries']` (default: `3`): sssd section `sssd` parameter

* `default['sssd']['config']['sssd']['debug_level']` (default: `0`): sssd section `sssd` parameter

* `default['sssd']['config']['domains'] (default: `{}`): domains


## Contributing

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests (`rake & rake knife`), ensuring they all pass
6. Write new resource/attribute description to `README.md`
7. Write description about changes to PR
8. Submit a Pull Request using Github


## Copyright & License

Authors:: Virender Khatri and [Contributors]

<pre>
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
</pre>


[Chef]: https://www.chef.io/
[Contributors]: https://github.com/vkhatri/chef-sssd/graphs/contributors

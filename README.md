# profile_pam_access

[![pdk-validate](https://github.com/ncsa/puppet-profile_pam_access/actions/workflows/pdk-validate.yml/badge.svg)](https://github.com/ncsa/puppet-profile_pam_access/actions/workflows/pdk-validate.yml)
[![yamllint](https://github.com/ncsa/puppet-profile_pam_access/actions/workflows/yamllint.yml/badge.svg)](https://github.com/ncsa/puppet-profile_pam_access/actions/workflows/yamllint.yml)

NCSA Common Puppet Profiles - base pam access config

## Dependencies
- [ncsa/pam_access](https://github.com/ncsa/puppet-pam_access.git)

## Reference

### class profile_pam_access (
-    Hash $allow_rules,
-    Hash $deny_rules,
-    Hash $deny_first_rules,
-    Hash $pam_config,
-    Array[ String[1] ] $required_pkgs,

[REFERENCE.md](REFERENCE.md)

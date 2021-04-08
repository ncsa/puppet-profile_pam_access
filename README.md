# profile_pam_access

![pdk-validate](https://github.com/ncsa/profile_pam_access/workflows/pdk-validate/badge.svg)
![yamllint](https://github.com/ncsa/profile_pam_access/workflows/yamllint/badge.svg)

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

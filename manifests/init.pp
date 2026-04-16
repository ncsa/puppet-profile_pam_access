# @summary Configure access.conf and pam 
#
# Configure access.conf and pam 
#
# @param allow_rules
#   All the allows to set in access.conf.
#   These come in the middle of the file.
#   Format is unique key, value=hash with 2 keys: "origin" and one of "user"
#   or "group" 
# @param deny_rules
#   All the deny's to set at the END of access.conf.
#   These come at the end of the file.
#   Format is (same as allow_rules).
# @param deny_first_rules
#   All the deny's to set at the BEGINNING of access.conf.
#   These come at the top of the file, before all the allow_rules settings.
#   This is useful for excluding groups of "disabled" users early in case 
#   some users may still be in an allowed group.
#   Format is (same as allow_rules).
# @param pam_config
#   Configuration params for "pam" resource (defined by
#   herculesteam/augeasprovders_pam). Hash is passed directly to
#   herculesteam/augeasproviders_pam. See also:
#   https://forge.puppet.com/herculesteam/augeasproviders_pam
# @param required_pkgs
#   Pkg names to be installed by OS pkg manager.
#   These are OS specific and defaults provided by this moudule
#   should be sufficient.
#
# @example
#   include profile_pam_access
class profile_pam_access (
  Hash $allow_rules,
  Hash $deny_rules,
  Hash $deny_first_rules,
  Hash $pam_config,
  Array[String[1]] $required_pkgs,
) {
  include pam_access

  ### Make sure pam is installed
  ensure_packages( $required_pkgs )


  pam_access::entry { 'Default Deny':
    user       => 'ALL',
    origin     => 'ALL',
    permission => '-',
    position   => 'after',
  }

  ensure_resources( 'pam_access::entry', $allow_rules,
    { 'permission' => '+',
      'position'   => '-1',
    }
  )

  ensure_resources( 'pam_access::entry', $deny_rules,
    { 'permission' => '-',
      'position'   => 'after',
    }
  )

  ensure_resources( 'pam_access::entry', $deny_first_rules,
    { 'permission' => '-',
      'position'   => 'before',
    }
  )
  -> pam_access::entry { 'Default Allow':
    user       => 'root',
    origin     => 'LOCAL',
    permission => '+',
    position   => 'before',
  }

  ### Configure pam
  ensure_resources( 'pam', $pam_config )
}

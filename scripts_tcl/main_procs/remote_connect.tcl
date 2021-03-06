proc remote_connect {} {
  if {[info exists ::disabled]} {puts "\n\tDisabled flag is set. Exit now."; return $::ERR_DISABLED}
  set ::files_to_get [list]
  lappend ::files_to_get $::impossible_file
  set ret [ssh_connect]
  if {$ret} {puts "\n\tERR: Can't connect.";return $ret}
  set ret [ssh_prompt]
  if {$ret} {puts "\n\tERR: Can't get new prompt.";return $ret}
  ssh_launch_cmd "mkdir -p $::bkp_rem_dir"
  if {[test_dir $::bkp_rem_dir]} {return $::ERR_GENERIC}
  ssh_launch_cmd "df -k $::bkp_rem_dir | awk '{if (NF>3)print \$(NF-2)}' | tail -1"
  if { "$::saved_output"  < $::bkp_rem_dir_freespace } {
    puts "\n\tERR: Remote temporary directory does not have enough free space: only $::saved_output and we need $::bkp_rem_dir_freespace.";
   return $::ERR_GENERIC;
  }

  return [expr [set_environment] && [getOS] && [getProc] &&[getVer] && [getHostname] && [ssh_copy_gnutools] ]
}

foreach script [glob [file join $scripts_tcl_dir/expect/ *.tcl]] {
  source $script
}

foreach script [glob [file join $scripts_tcl_dir/common/ *.tcl]] {
  source $script
}

foreach script [glob [file join $scripts_tcl_dir/app_logs_paths/ *.tcl]] {
  source $script
}

foreach script [glob [file join $scripts_tcl_dir/oracle/ *.tcl]] {
  source $script
}

set sshid 0
set sshpid -1
set timeout 60
set long_timeout 180
set oracle_timeout 300
set orig_prompt ""
set impossibleprompt "this should not be match by any prompt"
set prompt $impossibleprompt
set new_prompt "[randomstring 4]_mind_remote_console:: \r\n"
set file_data ""
set extra_exp ""
set extra_send ""
set operatingsystem ""
set ossolaris "solaris"
set oslinux "linux"
#so we don't backup everything:
set files_to_bkp { "somethingthatdoesnotexist" }
set maximum_size_to_backup [expr 1*1024*1024*1024]
set files_to_get [list]
set from_apps [list]
set saved_output [list]
set skip_list [list]
set emails [list "cristian.falcas@mindcti.com"]
set bkp_rem_dir [directpathname "/tmp/mindcti"]
set remote_skip_file "$bkp_rem_dir/files_to_skip"
set local_tmp_dir "/var/tmp/"
set status_path [directpathname "/var/run/mind"]
set local_dir [directpathname "/media/share/backups/remote_files/$customer_name"]
set local_dir_outputfiles [directpathname "/media/share/remote"]
set scripts_sql_dir [directpathname "$scripts_tcl_dir/../scripts_sql"]
set scripts_bash_dir [directpathname "$scripts_tcl_dir/../scripts_bash"]
#this is the default filename of the tar gzip result
set bkp_rem_archive "archive"
set get_period 60
set str_unix_statistics "unix_statistics"
myhash -add ::applications_array [list $::str_unix_statistics $bkp_rem_dir "" "*mind_*.log"] [list statistics]
set str_app_exceptions "apps_exceptions"
set str_app_logs "apps_logs"
set str_app_statistics "apps_statistics"
set str_app_skipdirs "apps_dir"
## applications_array has the following format: applications_array->type->app_dir->relative_path_to_log_dir->files = app_name
array set applications_array {}
array set tmp_array {}

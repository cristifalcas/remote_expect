foreach script [glob [file join $scripts_tcl_dir/expect/ *.tcl]] {
  source $script
}

foreach script [glob [file join $scripts_tcl_dir/main_procs/ *.tcl]] {
  source $script
}

foreach script [glob [file join $scripts_tcl_dir/app_logs_paths/ *.tcl]] {
  source $script
}

foreach script [glob [file join $scripts_tcl_dir/oracle/ *.tcl]] {
  source $script
}
source "$scripts_tcl_dir/error_codes.tcl"

set customer_name [file tail $crt_dir]
set sshid 0
set sshpid -1
set timeout 60
set long_timeout 180
set oracle_timeout 300
set mind_version ""
set orig_prompt "noprompt"
set impossibleprompt "this should not be match by any prompt [randomstring 14]"
set prompt $impossibleprompt
set new_prompt "[randomstring 4]_mind_remote_console:: \r\n"
set file_data ""
set extra_exp ""
set extra_send ""
set operatingsystem ""
set operatingsystemproc ""
set operatingsystemver ""
set operatingsystemhostname ""
set osproc ""
set ossolaris "solaris"
set oslinux "linux"
#so we don't backup everything:
set maximum_size_to_backup [expr {1*1024*1024*1024}]
set impossible_file "somethingthatdoesnotexist"
set files_to_get [list $impossible_file]
set from_apps [list]
set skip_list [list]
set saved_output [list]
set emails [list "cristian.falcas@mindcti.com"]
set oracle_sid "BILL"
set oracle_port 1521
set bkp_rem_dir "/tmp/mindcti"
set bkp_rem_dir_freespace [expr {1*1024*1024}]
set remote_tar_skip_file "tar_files_to_skip"
set remote_tar_include_files "tar_files_to_include"
set status_path [directpathname "/var/run/mind"]
set local_dir [directpathname "/mnt/share2/remote/backups/$customer_name"]

set local_dir_outputfiles [directpathname "/mnt/share2/remote/"]
set scripts_sql_dir [directpathname "$scripts_tcl_dir/../scripts_sql"]
set scripts_bash_dir [directpathname "$scripts_tcl_dir/../scripts_bash"]
#this is the default filename of the tar gzip result
set bkp_rem_archive "archive"
set get_period 240
set copy_tools "no"
set str_unix_statistics "unix_statistics"
set str_app_exceptions "apps_exceptions"
set str_app_logs "apps_logs"
set str_app_statistics "apps_statistics"
set str_app_skipdirs "apps_skip_dirs"
## applications_array has the following format: applications_array->type->app_dir->relative_path_to_log_dir->files = app_name
array set applications_array {}
array set tmp_array {}

set regexpmind {\([0-9]\{0,8\}\(_[0-9]\{0,5\}\)\?.log\|.log.[0-9]\{4\}-[0-9]\{2\}[0-9]\{2\}\)\(.gz\|.[0-9]\{1,5\}\)\?$}
set regexpall {*}
set regexpempty {$}

proc sipengine {{app_dir "/home/mind/mindcti/sipengine"}} {
  set myname [lindex [info level 0] 0]

  myhash -add ::applications_array [list $::str_app_exceptions $app_dir "log" "nicanica"] [list $myname]
  myhash -add ::applications_array [list $::str_app_logs $app_dir "syslog" "trace.log.\[0-9\]*"] [list $myname]
  myhash -add ::applications_array [list $::str_app_logs $app_dir "syslog" "trace.log"] [list $myname]
  myhash -add ::applications_array [list $::str_app_logs $app_dir "syslog" "sas*.log"] [list $myname]
  myhash -add ::applications_array [list $::str_app_logs $app_dir "syslog" "radius.log.\[0-9\]*"] [list $myname]
  myhash -add ::applications_array [list $::str_app_logs $app_dir "syslog" "radius.log"] [list $myname]
  myhash -add ::applications_array [list $::str_app_logs $app_dir "syslog" "output"] [list $myname]
  myhash -add ::applications_array [list $::str_app_logs $app_dir "syslog" "media.log.\[0-9\]*"] [list $myname]
  myhash -add ::applications_array [list $::str_app_logs $app_dir "syslog" "media.log"] [list $myname]
  myhash -add ::applications_array [list $::str_app_logs $app_dir "syslog" "jgroups.log.\[0-9\]*"] [list $myname]
  myhash -add ::applications_array [list $::str_app_logs $app_dir "syslog" "jgroups.log"] [list $myname]
  myhash -add ::applications_array [list $::str_app_logs $app_dir "syslog" "syslog.log.\[0-9\]*"] [list $myname]
  myhash -add ::applications_array [list $::str_app_logs $app_dir "syslog" "syslog.log"] [list $myname]
  myhash -add ::applications_array [list $::str_app_logs $app_dir "tciapps/tcidialer/log" "output.log"] [list $myname]
  myhash -add ::applications_array [list $::str_app_logs $app_dir "tciapps/tcifailover/log" "output.log"] [list $myname]
  myhash -add ::applications_array [list $::str_app_logs $app_dir "tciapps/tcionestage/log" "output.log"] [list $myname]
  myhash -add ::applications_array [list $::str_app_logs $app_dir "tciapps/tcizerostage/log" "output.log"] [list $myname]
  myhash -add ::applications_array [list $::str_app_logs $app_dir "tciapps/tciprepaid/log" "output.log"] [list $myname]
  myhash -add ::applications_array [list $::str_app_statistics $app_dir "syslog" "stats.log.*"] [list $myname]
  myhash -add ::applications_array [list $::str_app_statistics $app_dir "syslog" "stats.log"] [list $myname]

  proc $myname\_clean_exceptions {filename} {
    puts "coco"
  }
}

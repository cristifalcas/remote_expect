proc events {{app_dir "/home/mind/mindcti/jboss"}} {
  set myname [lindex [info level 0] 0]

  myhash -add ::applications_array [list $::str_app_exceptions $app_dir "log" "EVENTSErrors\[0-9\]"] [list $myname]
  myhash -add ::applications_array [list $::str_app_logs $app_dir "log" "EVENTSInfo\[0-9\]"] [list $myname]
  myhash -add ::applications_array [list $::str_app_statistics $app_dir "log" "eventsnicanicaSTATS.log"] [list $myname]
}
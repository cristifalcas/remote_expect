proc scp_put_files {files} {
  if {[file readable $files]} {puts "ok"} else {puts "NOK"}
  set spawnid [spawn scp $files $::user@$::ip:$::bkp_rem_dir/]
  expect {
    eof {puts "\n\tERR: EOF. Exit."; set ret 1}
    timeout { puts "\n\tERR: Could not send user/pass. Exit."; set ret 20 }
    "*Are you sure you want to continue connecting (yes/no)? $" {
      puts "\n\tMSG: First time login."
      exp_send "yes\r"
      exp_continue
    }
    "$::user@$::ip's password: " {
      puts "\n\tMSG: Logging in."
	  set ret 0;
    }
    "Password: " {
      puts "\n\tMSG: Logging in."
	  set ret 0
    }
  }
  if {$ret} {return $ret}

  catch {exp_send -i $spawn_id "$::pass\r"} res
  if {$res=="send: invalid spawn id (4)"} { return 1}
  expect {
    eof {puts "\n\tMSG: EOF.";set ret 0}
    timeout { puts "\n\tERR: Could not connect. Exit."; set ret 21 }
    "Permission denied, please try again." {
      puts "\n\tERR: Wrong username or password."
      set ret 1
    }
    "Resource temporarily unavailable" { puts "\n\tERR: Resource temporarily unavailable"; set ret 1 }
  }

  return $ret
}

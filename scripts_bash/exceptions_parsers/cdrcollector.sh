function cdrcollector() {
  reg='ERROR Description :'

  for filename in ${FILES[@]}; do
  cat $filename | gawk --re-interval -v RS="$regdate $regtime $reg\n" -v FS="\n" '{
    if (NR>1) {
      split(MATCH, array, " ")
      if ( array[3] == "ERROR" ) {
		pos = 2;
      } else if ( array[3] == "FATAL" ) {
		pos = 1
	  } else {
		pos =1
      } 
      if ( ($pos != "java.io.IOException: Can'"'"'t obtain connection to host") &&
	  ($pos != "com.mind.utils.ftp.client.engine.FtpException: Data: CloseSocket, Transfer Aborted") ) {
	print MATCH
	print $1;
	print $2;
	print $3;
	print "++++++++++++++++++++++++\n";
      }
    }
    MATCH=RT
  }' 
  done
} 

function finance() {
  reg='ERROR Description :'

  cat $(ls -tr ${FILES[@]}) | gawk --re-interval -v RS="$regdate $regtime $reg\n" -v FS="\n" '{
    if (NR>1) {
      if ( ($1 !~ "^Account with code: [[:digit:]]{2,} is performing a call$") &&
	  ($1 !~ "^Save data, for accountid: [[:digit:]]{1,}, failed$")) {
	print MATCH
	print $1;
	print $2;
	print $3;
	print "++++++++++++++++++++++++\n";
      }
    }
    MATCH=RT
  }'   
} 

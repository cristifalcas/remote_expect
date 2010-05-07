function rmweb() {
  reg="(ERROR|FATAL|INFO): [[:print:]]{1,}"
  for filename in ${FILES[@]}; do
  cat $filename | gawk --re-interval -v RS="$regdate $regtime $reg\n" -v FS="\n" '{ 
    if (NR>1) { 
      split(MATCH, array, " ")
      if ( array[3] == "ERROR" ) {
		pos = 2;
      } else {
		pos =1
      } 

      if (	 ($pos !~ "^coco$")		) {
	print MATCH, $1;
	print $2
	if (pos==2) {
	    print $3
	    print $4
	}
	print "++++++++++++++++++++++++\n";
      }
    }
    MATCH=RT 
  }'
  done 
} 


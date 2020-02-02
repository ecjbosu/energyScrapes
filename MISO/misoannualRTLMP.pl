#!/usr/bin/perl -w
#get the Power price files from ISO's

	use Date::Business;
	$DLDIR="/Share/scrapes";
	$ISO="MISO";
	$wdir="/RTLMP-Annual";
        $fn ="RT_LMPs.zip";
	$d = new Date::Business(); 
	
	@year = (2011..2019);
	@qtr1 = qw/Jan Apr Jul Oct/;
	@qtr2 = qw/Mar Jun Sep Dec/;
        @qtr1a = qw/Jan APR Jul Oct/;
	@qtr2a = qw/Mar JUN Sep Dec/;

	print "@year\n";
	print "@qtr1\n";
	print "@qtr2\n";
	
	$url ="https://docs.misoenergy.org/marketreports/"; #2019_Oct-Dec_DA_LMPs.zip
	#$DATE=substr(`date +%Y%m%d`,0,-1); # does not allow for date manipulation
	# $DATE='20051206'; # testing date

#testing
#$PDIR="/test";
#PJM
	$filenum=20060601;
	#day ahead are current day when this is executed after 12am
 	#$d->prev();         # previous calendar day
	#$DATE=  $d->image(); # returns YYYYMMDD string
	$PDIR=$wdir; #"/da";
	for($i=2011;$i<=2019;$i++){
	#print "$i\n";
		for($j=1;$j<=4;$j++){
			#for($dy=1;$dy<=31;$dy++){					
			print "wget -nH -N -X /cgi-bin $url$i%5F$qtr1[$j-1]-$qtr2[$j-1]%5F$fn -P $DLDIR/$ISO/$PDIR\n";
			`wget -nH -N -X /cgi-bin $url$i%5F$qtr1[$j-1]-$qtr2[$j-1]%5F$fn -P $DLDIR/$ISO/$PDIR`;
			`wget -nH -N -X /cgi-bin $url$i%5F$qtr1a[$j-1]-$qtr2a[$j-1]%5F$fn -P $DLDIR/$ISO/$PDIR`; #incase of typepo
			#}
		} 
	}

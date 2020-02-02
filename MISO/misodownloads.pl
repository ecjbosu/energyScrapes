#!/usr/bin/perl -w
#get the Power price files from ISO's

	use Date::Business;
	$DLDIR="/NightlyDLs";
	$ISO="miso";
	$wdir="/wwget";

	$d = new Date::Business(); 

	#$DATE=substr(`date +%Y%m%d`,0,-1); # does not allow for date manipulation
	# $DATE='20051206'; # testing date

#testing
#$PDIR="/test";
#PJM
	$filenum=20060601;
	#day ahead are current day when this is executed after 12am
 	#$d->prev();         # previous calendar day
	#$DATE=  $d->image(); # returns YYYYMMDD string
	$PDIR="/da";
	for($i=2007;$i<=2007,$i++){
		for($j=6;$j<=12;$j++){
			for($dy=1;$dy<=31;$dy++){					

			`$wdir/wget -nH -N -X /cgi-bin ftp://ftp.midwestmarket.org/mkt_reports/da_lmp/$i$j$dy_da_lmp.csv -P $DLDIR/$ISO/$PDIR`;
			}
		} 
	}
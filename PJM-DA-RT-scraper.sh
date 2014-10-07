#!/usr/bin/perl -w
#get the Power price files from ISO's

	use Date::Business;
	$DLDIR="/Share/scrapes/";

	$d = new Date::Business(); 

	#$DATE=substr(`date +%Y%m%d`,0,-1); # does not allow for date manipulation
	# $DATE='20051206'; # testing date

#testing
#$PDIR="/test";
#PJM
	#day ahead are current day when this is executed after 12am
	#$d->prev();         # previous calendar day
	$d->next();
	$DATE=  $d->image(); # returns YYYYMMDD string
	$PDIR="/da";
	`wget -nH -N -X /cgi-bin ftp://ftp.pjm.com/pub/account/lmpda/$DATE-da.csv -P $DLDIR/PJM$PDIR`;

	$d->prev();         # previous calendar day
	$DATE=  $d->image(); # returns YYYYMMDD string
	$PDIR="/da";
	`wget -nH -N -X /cgi-bin ftp://ftp.pjm.com/pub/account/lmpda/$DATE-da.csv -P $DLDIR/PJM$PDIR`;
        $PDIR="/rt";
        `wget -nH -N -X /cgi-bin ftp://ftp.pjm.com/pub/account/lmp/$DATE.csv -P $DLDIR/PJM$PDIR`;

	#get the generation outages for yesterday
 	$d->prev();         # previous calendar day
	$PDIR="genouts";
	`wget -nH -N -X /cgi-bin ftp://ftp.pjm.com/pub/account/genoutages/genout.csv -O $DLDIR/PJM/$PDIR/"$DATE"_genout.csv`;
	
	#Real time are two days back when this is executed after 12am	
	$PDIR="/rt";
	$DATE=  $d->image(); # returns YYYYMMDD string
	`wget -nH -N -X /cgi-bin ftp://ftp.pjm.com/pub/account/lmp/$DATE.csv -P $DLDIR/PJM$PDIR`;

	#go back three more days to cover weekends and holidays, will over write files so no worry.
	#Real time are two days back when this is executed after 12am	
	$d->prev();
	$PDIR="/rt";
	$DATE=  $d->image(); # returns YYYYMMDD string
	`wget -nH -N -X /cgi-bin ftp://ftp.pjm.com/pub/account/lmp/$DATE.csv -P $DLDIR/PJM$PDIR`;
	#Real time are two days back when this is executed after 12am	
	$d->prev();
	$PDIR="/rt";
	$DATE=  $d->image(); # returns YYYYMMDD string
	`wget -nH -N -X /cgi-bin ftp://ftp.pjm.com/pub/account/lmp/$DATE.csv -P $DLDIR/PJM$PDIR`;
	#Real time are two days back when this is executed after 12am	
	$d->prev();
	$PDIR="/rt";
	$DATE=  $d->image(); # returns YYYYMMDD string
	`wget -nH -N -X /cgi-bin ftp://ftp.pjm.com/pub/account/lmp/$DATE.csv -P $DLDIR/PJM$PDIR`;

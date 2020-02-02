#!/usr/bin/perl -w
#get the Power price files from ISO's

	use Date::Business;
	$DLDIR="/Share/scrapes";
	$ISO="MISO";
	$wdir="DAEPNode";
        $fn ="DA_Load_EPNodes_";
	
# 	@year = (2011..2019);
# 	@qtr1 = qw/Jan Apr Jul Oct/;
# 	@qtr2 = qw/Mar Jun Sep Dec/;
#         @qtr1a = qw/Jan APR Jul Oct/;
# 	@qtr2a = qw/Mar JUN Sep Dec/;

# 	print "@year\n";
# 	print "@qtr1\n";
# 	print "@qtr2\n";
	
	#https://docs.misoenergy.org/marketreports/20160425_5min_exante_lmp.xls

	$url ="https://docs.misoenergy.org/marketreports/"; #2019_Oct-Dec_DA_LMPs.zip
	$d = new Date::Business(); 
	
	$DATE=$d->image(); # returns YYYYMMDD string
	# $DATE='20051206'; # testing date
#        print "$DATE\n";
#testing
#$PDIR="/test";
#PJM
	$filenum=20141228; #20160425
	#day ahead are current day when this is executed after 12am
 	#$d->prev();         # previous calendar day
	#$DATE=  $d->image(); # returns YYYYMMDD string
	$PDIR=$wdir; #"/da";
 	for($i=$filenum;$i<=$DATE;$i++){
# 	print "$i\n";
             #print "wget -nH -N -X /cgi-bin $url$fn${i}_.zip -P $DLDIR/$ISO/$PDIR\n";
             #print "$DLDIR/$ISO/$PDIR/${i}_$fn.zip\n";
             
             if (substr($i, 6,2)<=31) {
             if (substr($i,4,2)<=12){
             `wget -nH -N -X /cgi-bin $url$fn${i}.zip -P $DLDIR/$ISO/$PDIR`;
             }
             }
#             `wget -nH -N -X /cgi-bin $url$i%5F$qtr1a[$j-1]-$qtr2a[$j-1]%5F$fn -P $DLDIR/$ISO/$PDIR`; #incase of typepo
             #`zip -9m $DLDIR/$ISO/$PDIR/${i}_$fn.zip $DLDIR/$ISO/$PDIR/${i}_$fn`;
 	}

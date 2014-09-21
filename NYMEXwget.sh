#!/usr/bin/perl -w
#######!/bin/bash
# 
# requires perl package Date::business
# please see shell script for cpan installation
#
# nightly NYMEX wget cron job
	use Date::Business;
	use Cwd;
	$DLDIR="/Share/scrapes/NYMEX";
	$padlen=2;

	#-- get current directory
my $pwd = cwd();
 
# replace above with perl script to handle night time dl and rolling date back one day 
# since nymex post prices by close of business day.
	$d = new Date::Business(); 

#	 $DATE='20131129'; # testing date

	#roll back one day since this is executed after 12am
 	#$d->prev();         # previous calendar day
	$DATE=  $d->image(); # returns YYYYMMDD string
	$YR=substr($DATE,0,4);
	$t1=substr($DATE,4,2);
	$Mon=sprintf("%0${padlen}d", $t1);
	$t1=substr($DATE,6,2);
	$day=sprintf("%0${padlen}d", $t1);
	$xmlDate=$DATE;
	$DATE=$YR."-".$Mon."-".$day;

	`wget -nH -N -X /cgi-bin ftp://ftp.cmegroup.com/pub/settle/nymex_future.csv -O $DLDIR/nymex_futures.$DATE.csv`;
	`wget -nH -N -X /cgi-bin ftp://ftp.cmegroup.com/pub/settle/nymex_option.csv -O $DLDIR/nymex_option.$DATE.csv`;
	`wget -nH -N -X /cgi-bin ftp://ftp.cmegroup.com/pub/settle/comex_future.csv -O $DLDIR/comex_future.$DATE.csv`;
	`wget -nH -N -X /cgi-bin ftp://ftp.cmegroup.com/pub/settle/comex_option.csv -O $DLDIR/comex_option.$DATE.csv`;
	`wget -nH -N -X /cgi-bin ftp://ftp.cmegroup.com/pub/daily_volume/daily_volume.xls -O $DLDIR/daily_volume_$DATE.xls`;
	`wget -nH -N -X /cgi-bin ftp://ftp.cmegroup.com/pub/settle/cme_holidays.csv -O $DLDIR/cme_holidays-$DATE.txt`;

# downloading xml files is tricky so change directory to scrapes directory and do wget with wild cards
# We could change this to the files names as the R script example shows.  (to be uploaded later).
chdir($DLDIR);
	`wget -nH -N -X /cgi-bin ftp://ftp.cmegroup.com/pub/settle/\*$xmlDate\*xml`;
#move the files from root to DLDIR
chdir($pwd);

#system("mv -v /root/*.xml $DLDIR");
#this works but it not very good practise


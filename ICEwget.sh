#!/usr/bin/perl -w
#######!/bin/bash
# nightly ICE wget cron job
	use Date::Business;
	$DLDIR="/Share/scrapes/ICE";
	$wdir="/usr/bin";
	$padlen=2;

$user="changeuser";
$password="changepassword";

	$d = new Date::Business(); 
#$d->prev();
	$DATE=  $d->image(); # returns YYYYMMDD string
	$YR=substr($DATE,0,4);
	$t1=substr($DATE,4,2);
	$Mon=sprintf("%0${padlen}d", $t1);
	$t1=substr($DATE,6,2);
	$day=sprintf("%0${padlen}d", $t1);
	#power
	$file="icecleared_power_".$YR."_".$Mon."_".$day.".xls";
	$URL="https://$user:$password\@downloads.theice.com/Settlement_Reports";
	`$wdir/wget -nH -N -X /cgi-bin $URL/Power/$file -P $DLDIR/Power --no-check-certificate`;
        $file="ngxcleared_power_".$YR."_".$Mon."_".$day.".xls";
        `$wdir/wget -nH -N -X /cgi-bin $URL/Power/$file -P $DLDIR/Power --no-check-certificate`;
	#gas
	$file="icecleared_gas_".$YR."_".$Mon."_".$day.".xls";
	`$wdir/wget -nH -N -X /cgi-bin $URL/Gas/$file -P $DLDIR/Gas --no-check-certificate`;
        $file="ngxcleared_gas_".$YR."_".$Mon."_".$day.".xls";
        `$wdir/wget -nH -N -X /cgi-bin $URL/Gas/$file -P $DLDIR/Gas --no-check-certificate`;
	$file="icecleared_gasoptions_".$YR."_".$Mon."_".$day.".xls";
	`$wdir/wget -nH -N -X /cgi-bin $URL/Gas/$file -P $DLDIR/Gas --no-check-certificate`;
	#oil
	$file="icecleared_oil_".$YR."_".$Mon."_".$day.".xls";
	`$wdir/wget -nH -N -X /cgi-bin $URL/Oil/$file -P $DLDIR/Oil --no-check-certificate`;
        $file="ngxcleared_oil_".$YR."_".$Mon."_".$day.".xls";
        `$wdir/wget -nH -N -X /cgi-bin $URL/Oil/$file -P $DLDIR/Oil --no-check-certificate`;
        $file="icecleared_oiloptions_".$YR."_".$Mon."_".$day.".xls";
        `$wdir/wget -nH -N -X /cgi-bin $URL/Oil/$file -P $DLDIR/Gas --no-check-certificate`;
        $file="iceclearedoil_ca_".$YR."_".$Mon."_".$day.".xls";
        `$wdir/wget -nH -N -X /cgi-bin $URL/Oil/$file -P $DLDIR/Oil --no-check-certificate`;
	#power
	$URL="https://$user:$password\@downloads.theice.com/Settlement_Reports_CSV";
	$file="icecleared_power_".$YR."_".$Mon."_".$day.".dat";
	`$wdir/wget -nH -N -X /cgi-bin $URL/Power/$file -P $DLDIR/Power --no-check-certificate`;
        $file="ngxcleared_power_".$YR."_".$Mon."_".$day.".dat";
        `$wdir/wget -nH -N -X /cgi-bin $URL/Power/$file -P $DLDIR/Power --no-check-certificate`;
	$file="icecleared_poweroptions_".$YR."_".$Mon."_".$day.".dat";
	`$wdir/wget -nH -N -X /cgi-bin $URL/Power/$file -P $DLDIR/Power --no-check-certificate`;
	#gas
	$file="icecleared_gas_".$YR."_".$Mon."_".$day.".dat";
	`$wdir/wget -nH -N -X /cgi-bin $URL/Gas/$file -P $DLDIR/Gas --no-check-certificate`;
        $file="ngxcleared_gas_".$YR."_".$Mon."_".$day.".dat";
        `$wdir/wget -nH -N -X /cgi-bin $URL/Gas/$file -P $DLDIR/Gas --no-check-certificate`;
	$file="icecleared_gasoptions_".$YR."_".$Mon."_".$day.".dat";
	`$wdir/wget -nH -N -X /cgi-bin $URL/Gas/$file -P $DLDIR/Gas --no-check-certificate`;
	#oil
	$file="icecleared_oil_".$YR."_".$Mon."_".$day.".dat";
	`$wdir/wget -nH -N -X /cgi-bin $URL/Oil/$file -P $DLDIR/Oil --no-check-certificate`;
        $file="iceclearedoil_ca_".$YR."_".$Mon."_".$day.".dat";
        `$wdir/wget -nH -N -X /cgi-bin $URL/Oil/$file -P $DLDIR/Oil --no-check-certificate`;
        $file="ngxcleared_oil_".$YR."_".$Mon."_".$day.".dat";
        `$wdir/wget -nH -N -X /cgi-bin $URL/Oil/$file -P $DLDIR/Oil --no-check-certificate`;
	$file="icecleared_oiloptions".$YR."_".$Mon."_".$day.".dat";
	`$wdir/wget -nH -N -X /cgi-bin $URL/Oil/$file -P $DLDIR/Oil --no-check-certificate`;
# 	$file="icecleared_oiloptions_".$YR."_".$Mon."_".$day.".dat";
#       `$wdir/wget -nH -N -X /cgi-bin $URL/Oil/$file -P $DLDIR/Gas --no-check-certificate`;

#wget -nH -N -X /cgi-bin https://$user:$password@downloads.theice.com/Settlement_Reports/Power/icecleared_power_2006_08_11.xls -P /nightlydls/ice/Power --no-check-certificatcecleared_gasoptions_".$YR."_".$Mon."_".$day.".dat";


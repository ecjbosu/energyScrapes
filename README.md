energyScrapes
=============

Energy Data scrapes  (Natural Gas, Power, Oil, and others)

This repository will include data scrapes for commoidty price data, primarily settled prices for Natural Gas, Oil, Basis(Spreads), options and other energy commodities and instruments from the ftp (text, xml or other file typs) and html web pages.

Assistance with adding power iso, pipelines, and other energy data sources would be greatly appreciated.
 <ul>
<li>Perl Scripts: can be added cron or other task schedular (require Date::BUsiness package on link shown below)/li><ul>
<li>NYMEXwget.sh will download cme settle files (spreadsheet and xml) from ftp://ftp.cmegroup.com/pub/settle./li>
<li>ICEwget.sh will downlaod the ICE end of day settle files, both spreadsheet and text delimited.  ICE requires a ftp login./li></ul>
<li>Other files:</li>
<ul>
<li>ICE_wget_all.txt is a text file showing examples of using wget to extract all historical ICE EOD files from the ftp server.  ICE requires a ftp login./li>
<li>PerlBusinessDayInstall.sh is a shell script to help install teh perl Date::Business date package (http://search.cpan.org/~desiminer/Date-Business-1.2/Business.pm) that is needed ro the wget perl scripts.</li>
</ul></ul>

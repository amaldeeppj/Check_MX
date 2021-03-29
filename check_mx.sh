#!/usr/bin/bash

#Script by Amaldeep <amaldeeppjcoc1@gmail.com>

#create a file to store the domains using specified MX record
touch domains_using_your_mx

#specify MX records with trailing dot
MX_1=specify_mx_record_with_trailing_dot.
MX_2=specify_mx_record_with_trailing_dot.

while read -r domain
do

#echo ======================================
#echo $domain
#dig +short mx $domain | sort -h | head -1
dig +short mx $domain | sort -h | head -1 | awk -v mx1=$MX_1 -v mx2=$MX_2 -v DOM=$domain '{if (tolower($2) == tolower(mx1) || tolower($2) == tolower(mx2)) print DOM}' >> domains_using_your_mx
#dig +short mx $domain | sort -h | head -1 | awk -v mx1=$MX_1 -v mx2=$MX_2 '{if (tolower($2) == tolower(mx1) || tolower($2) == tolower(mx2)) print "USING YOUR MX"}'
#dig +short mx $domain | sort -h | head -1 | awk -v mx1=$MX_1 -v mx2=$MX_2 '{print tolower($2) " : " tolower(mx1) " : " tolower(mx2) }'

done < <(cut -d ':' -f 1 /etc/userdomains | tail -n +2)

#echo ======================================

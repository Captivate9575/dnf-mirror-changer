#!/bin/sh
read -p "Country for mirrors, based on the ISO standard: " country
country=$(echo $country | tr '[:upper:]' '[:lower:]')
read -p "You set $country, want to continue? Say no to go straight to DNF configurations (Y/N) " -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
	cd /etc/yum.repos.d/
	sed -i -s -e "/metalink/s/$/\&country=$country/" *.repo
	echo "Done"
fi

read -p "Make [Y] default and 10 parallel downloads in DNF? (Y/N) " -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo "defaultyes=True" >> /etc/dnf/dnf.conf
	echo "max_parallel_downloads=10" >> /etc/dnf/dnf.conf 
	echo "Done"
fi

read -rsn1 -p "Alright bye, press any key to exit ";echo

#grep -R metalink /etc/yum.repos.d/
#sed -i -e '/metalink/s/$/&country=uk/' fedora.repo
#sed -i -s -e '/metalink/s/$/\&country=uk/' *.repo

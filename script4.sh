#!/bin/sh

finder () {
	find /etc -name "*.conf" -print 2> /dev/null | tee -a ~/listeconfd
}

sedCat () {
	sed -r 's/.*\/(.*).conf/\0 \/home\/gg\/conf\/\1.conf2/g' /home/gg/listeconfd > /home/gg/listeconf
}

#awkCat () {
#	awk
#}

cp () {
	cat ~/listeconf | xargs -n2 cp
}

##########################################
finder
sedCat
cp

#!/bin/bash
# save the message to a file
cat - > /tmp/timezoneconvert.$$
# extract the date header
thedate=$( awk '/^Date: / && !i { $1="" ; print $0 ; i=1}' )
# convert to the current timezone (defined by TZ)
thedate=$( date -d "$thedate" )
# output the modified message
awk "{ if (/^Date: /) print \"Date: $thedate\"; else print $0; }" \
</tmp/timezoneconvert.$$
# clean up
rm /tmp/timezoneconvert.$$

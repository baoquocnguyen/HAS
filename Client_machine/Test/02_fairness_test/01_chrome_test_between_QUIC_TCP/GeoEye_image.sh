#!/bin/bash

#curl -s -o foo https://172.20.36.146/hasplayer.js/samples/Dash-IF/index.html && echo "done1" &
#curl -s -o bar https://172.20.36.146/hasplayer.js/samples/Dash-IF/index.html && echo "done2" & 
#curl -s -o baz https://172.20.36.146/hasplayer.js/samples/Dash-IF/index.html && echo "done3" &

#google-chrome --user-data-dir=/tmp/chrome --no-proxy-server --enable-quic --origin-to-force-quic-on=quic.clemente.io:443 --host-resolver-rules='MAP quic.clemente.io:443 172.20.36.146:6121' https://quic.clemente.io/test/GeoEye.jpg&
#go run /home/quoc/work/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:6121/test/Airbus.jpg > text.txt&

#google-chrome --user-data-dir=/tmp/chrome --no-proxy-server --enable-quic --origin-to-force-quic-on=quic.clemente.io:443 --host-resolver-rules='MAP quic.clemente.io:443 172.20.36.146:6121' https://quic.clemente.io&

# backup information for future use

#
# start
# request image from quic server 

google-chrome --user-data-dir=/tmp/chrome --no-proxy-server --enable-quic --origin-to-force-quic-on=quic.clemente.io:443 --host-resolver-rules='MAP quic.clemente.io:443 172.20.36.146:6121' https://quic.clemente.io/test/GeoEye.jpg&


# request image from http/2 server 
google-chrome --user-data-dir=/tmp/chrome --new-window --no-proxy-server https://172.20.36.146/test/GeoEye.jpg&



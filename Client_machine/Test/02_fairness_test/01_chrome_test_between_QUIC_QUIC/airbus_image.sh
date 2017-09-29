#!/bin/bash

#curl -s -o foo https://172.20.36.146/hasplayer.js/samples/Dash-IF/index.html && echo "done1" &
#curl -s -o bar https://172.20.36.146/hasplayer.js/samples/Dash-IF/index.html && echo "done2" & 
#curl -s -o baz https://172.20.36.146/hasplayer.js/samples/Dash-IF/index.html && echo "done3" &
#wget -nv 100 https://quic.clemente.io/hasplayer.js/samples/Dash-IF/index.html&
#google-chrome https://quic.clemente.io/hasplayer.js/samples/Dash-IF/index.html
# Below command line are backup information


#start
#request image from quic server 

google-chrome --incognito --user-data-dir=/tmp/chrome --new-window --no-proxy-server --enable-quic --origin-to-force-quic-on=quic.clemente.io:443 --host-resolver-rules='MAP quic.clemente.io:443 172.20.36.146:6121' https://quic.clemente.io/test/Airbus.jpg&


#request image from quic server 
google-chrome --incognito --user-data-dir=/tmp/chrome --new-window --no-proxy-server --enable-quic --origin-to-force-quic-on=quic.clemente.io:443 --host-resolver-rules='MAP quic.clemente.io:443 172.20.36.146:6121' https://quic.clemente.io/test/Airbus.jpg&


#!/bin/bash

#curl -s -o foo https://172.20.36.146/hasplayer.js/samples/Dash-IF/index.html && echo "done1" &
#curl -s -o bar https://172.20.36.146/hasplayer.js/samples/Dash-IF/index.html && echo "done2" & 
#curl -s -o baz https://172.20.36.146/hasplayer.js/samples/Dash-IF/index.html && echo "done3" &

google-chrome --user-data-dir=/tmp/chrome --no-proxy-seer --enable-quic --origin-to-force-quic-on=quic.clemente.io:443 --host-resolver-rules='MAP quic.clemente.io:443 172.20.36.146:6121' https://quic.clemente.io/hasplayer.js/doc/JSDoc/README.md&

google-chrome --user-data-dir=/tmp/chrome --new-window --no-proxy-seer --enable-quic --origin-to-force-quic-on=quic.clemente.io:443 --host-resolver-rules='MAP quic.clemente.io:443 172.20.36.146:6121' https://172.20.36.146/hasplayer.js/doc/JSDoc/README.md&
#google-chrome https://quic.clemente.io/hasplayer.js/samples/Dash-IF/index.html
#wget -nv 100 https://quic.clemente.io/hasplayer.js/samples/Dash-IF/index.html&

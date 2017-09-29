#!/bin/bash

#curl -s -o foo https://172.20.36.146/hasplayer.js/samples/Dash-IF/index.html && echo "done1" &
#curl -s -o bar https://172.20.36.146/hasplayer.js/samples/Dash-IF/index.html && echo "done2" & 
#curl -s -o baz https://172.20.36.146/hasplayer.js/samples/Dash-IF/index.html && echo "done3" &
# backup information

#
# start
# request video from quic server

google-chrome --user-data-dir=/tmp/chrome --no-proxy-server --enable-quic --origin-to-force-quic-on=quic.clemente.io:443 --host-resolver-rules='MAP quic.clemente.io:443 172.20.36.146:6121' https://quic.clemente.io/dash.js/samples/video_source/hal_bbb/bigbuckbunny_1080.mp4&



# request video from quic server
google-chrome --user-data-dir=/tmp/chrome --new-window --no-proxy-server https://172.20.36.146/dash.js/samples/video_source/hal_bbb/bigbuckbunny_1080.mp4&


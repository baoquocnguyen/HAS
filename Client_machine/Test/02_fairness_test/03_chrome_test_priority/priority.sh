#!/bin/bash


#google-chrome --user-data-dir=/tmp/chrome --no-proxy-server --enable-quic --origin-to-force-quic-on=quic.clemente.io:443 --host-resolver-rules='MAP quic.clemente.io:443 172.20.36.146:6121' https://quic.clemente.io/test/Airbus.jpg&



#request image from http/2 server 
google-chrome --user-data-dir=/tmp/chrome --new-window --no-proxy-server https://172.20.36.146/test/priority_load_image.html


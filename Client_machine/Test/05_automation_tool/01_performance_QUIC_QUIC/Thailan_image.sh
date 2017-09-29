#!/bin/bash

# Access to the server machine
# Setup network condition and server
ssh quoc@172.20.36.146 sh /home/quoc/bash_go_server.sh&

sleep 5

# Start network monitor tcpdump
sudo tcpdump -i ens160 -s 42 -w result.pcapng&

sleep 10

# Run a test
sh Thailan_map_image.sh&


sleep 30

# Run again
sh Thailan_map_image.sh&

sleep 30

# Kill network monitor tcpdump
sudo kill -9 $(pgrep tcpdump)

# Log data into log file
tshark -nr result.pcapng -T fields -E separator=' ' -e frame.time_delta -e frame.len -e tcp.srcport -e tcp.dstport -e udp.srcport -e udp.dstport > log.txt

# run output performance
python performance.py

#request image from quic server 
# google-chrome --incognito --user-data-dir=/tmp/chrome --new-window --no-proxy-server --enable-quic --origin-to-force-quic-on=quic.clemente.io:443 --host-resolver-rules='MAP quic.clemente.io:443 172.20.36.146:6121' https://quic.clemente.io/test/Thailan.jpg&
#
##request image from http/2 server 
#google-chrome --user-data-dir=/tmp/chrome --new-window --no-proxy-server https://172.20.36.146/test/Thailan.jpg&


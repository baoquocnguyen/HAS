#!/bin/bash

# initial for QUIC certification
# wait 5 seconds
sleep 5

google-chrome --incognito --user-data-dir=/tmp/chrome --new-window --no-proxy-server --enable-quic --origin-to-force-quic-on=quic.clemente.io:443 --host-resolver-rules='MAP quic.clemente.io:443 172.20.36.146:6121' https://quic.clemente.io&

# wait 10 seconds
sleep 10

# ====>>>>>>
# run tcpdump at client
sudo tcpdump -i ens160 -s 42 -w result_client/result_client.pcapng&

# run tcpdump at server
ssh quoc@172.20.36.146 sudo tcpdump -i eth0 -s 42 -w /home/quoc/Test/05_automation_tool/result_server.pcapng&

# ====>>>>>>
# wait 10 seconds
sleep 10

# ====>>>>>>
#request image from QUIC server 
#google-chrome --incognito --user-data-dir=/tmp/chrome --new-window --no-proxy-server --enable-quic --origin-to-force-quic-on=quic.clemente.io:443 --host-resolver-rules='MAP quic.clemente.io:443 172.20.36.146:6121' https://quic.clemente.io/test/test.jpg&
#google-chrome --incognito --user-data-dir=/tmp/chrome --new-window --no-proxy-server --enable-quic --origin-to-force-quic-on=quic.clemente.io:443 --host-resolver-rules='MAP quic.clemente.io:443 172.20.36.146:6121' https://quic.clemente.io/test/world.topo.png&
#google-chrome --incognito --user-data-dir=/tmp/chrome --new-window --no-proxy-server --enable-quic --origin-to-force-quic-on=quic.clemente.io:443 --host-resolver-rules='MAP quic.clemente.io:443 172.20.36.146:6121' https://quic.clemente.io/test/Thailan.jpg&
google-chrome --incognito --user-data-dir=/tmp/chrome --new-window --no-proxy-server --enable-quic --origin-to-force-quic-on=quic.clemente.io:443 --host-resolver-rules='MAP quic.clemente.io:443 172.20.36.146:6121' https://quic.clemente.io/test/Airbus.jpg&

# ====>>>>>>
#request image from HTTP/2 server 
#google-chrome --user-data-dir=/tmp/chrome --new-window --no-proxy-server https://172.20.36.146/test/test.jpg&
#google-chrome --user-data-dir=/tmp/chrome --new-window --no-proxy-server https://172.20.36.146/test/world.topo.png&
#google-chrome --user-data-dir=/tmp/chrome --new-window --no-proxy-server https://172.20.36.146/test/Thailan.jpg&
google-chrome --user-data-dir=/tmp/chrome --new-window --no-proxy-server https://172.20.36.146/test/Airbus.jpg&

# wait 120 seconds
sleep 120

# ====>>>>>>
# Turn off 2 chrome clients
kill -9  $(pgrep chrome)


# ====>>>>>>
# Turn off tcp dump at client
sudo kill -9 $(pgrep tcpdump)


# ====>>>>>>
# Turn off tcp dump at server
ssh quoc@172.20.36.146 sh /home/quoc/Test/05_automation_tool/tcpdump_close.sh 


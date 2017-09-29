#!/bin/bash

# Access to the server machine
# ssh quoc@172.20.36.146

# ssh quoc@172.20.36.146 sudo tc qdisc del dev eth0 root


#sudo tc qdisc del dev eth0 root
# Turn off server
# ssh quoc@172.20.36.146 sudo kill  $(pgrep go)
# kill $(ps aux | grep go | grep -v "grep" | cut -d " " -f2)

# Setup network condition
#sudo sh /home/quoc/Test/03_netem_test/loss_netem_script_test.sh

# Turn on server
# sh /home/quoc/bash.sh
# ssh quoc@172.20.36.146 sh /home/quoc/Test/05_automation_tool/server_bandwith_10mb_netem.sh&

##sleep 5

google-chrome --incognito --user-data-dir=/tmp/chrome --new-window --no-proxy-server --enable-quic --origin-to-force-quic-on=quic.clemente.io:443 --host-resolver-rules='MAP quic.clemente.io:443 172.20.36.146:6121' https://quic.clemente.io&

google-chrome --incognito --user-data-dir=/tmp/quic --new-window --no-proxy-server --enable-quic --origin-to-force-quic-on=mydomain.com:443 --host-resolver-rules='MAP mydomain.com:443 172.20.36.146:6131' https://mydomain.com&


google-chrome --user-data-dir=/tmp/http_12 --new-window --no-proxy-server https://172.20.36.146:443&
google-chrome --user-data-dir=/tmp/http_22 --new-window --no-proxy-server https://172.20.36.146:445&

#google-chrome --user-data-dir=/tmp/http_22 --new-window --no-proxy-server https://172.20.36.146&
sleep 10

# run tcpdump at client
sudo tcpdump -i ens160 -s 42 -w result_client/result_client.pcapng&
# run tcpdump at server
# ssh quoc@172.20.36.146 sh /home/quoc/Test/05_automation_tool/tcpdump_server.sh 
ssh quoc@172.20.36.146 sudo tcpdump -i eth0 -s 42 -w /home/quoc/Test/05_automation_tool/03_performance_multiple_QUIC_TCP/result_server.pcapng&


sleep 10

#request image from quic server 
#google-chrome --incognito --user-data-dir=/tmp/chrome --new-window --no-proxy-server --enable-quic --origin-to-force-quic-on=quic.clemente.io:443 --host-resolver-rules='MAP quic.clemente.io:443 172.20.36.146:6121' https://quic.clemente.io/test/test.jpg&
#google-chrome --incognito --user-data-dir=/tmp/chrome --new-window --no-proxy-server --enable-quic --origin-to-force-quic-on=quic.clemente.io:443 --host-resolver-rules='MAP quic.clemente.io:443 172.20.36.146:6121' https://quic.clemente.io/test/world.topo.png&

google-chrome --incognito --user-data-dir=/tmp/chrome --new-window --no-proxy-server --enable-quic --origin-to-force-quic-on=quic.clemente.io:443 --host-resolver-rules='MAP quic.clemente.io:443 172.20.36.146:6121' https://quic.clemente.io/test/Airbus.jpg&
#google-chrome --incognito --user-data-dir=/tmp/chrome --new-window --no-proxy-server --enable-quic --origin-to-force-quic-on=quic.clemente.io:443 --host-resolver-rules='MAP quic.clemente.io:443 172.20.36.146:6121' https://quic.clemente.io/test/Thailan.jpg&

#oogle-chrome --incognito --user-data-dir=/tmp/quic --new-window --no-proxy-server --enable-quic --origin-to-force-quic-on=mydomain.com:443 --host-resolver-rules='MAP mydomaint.com:443 172.20.36.146:6131' https://mydomain.com/test/Thailan.jpg&
google-chrome --incognito --user-data-dir=/tmp/quic --new-window --no-proxy-server --enable-quic --origin-to-force-quic-on=mydomain.com:443 --host-resolver-rules='MAP mydomaint.com:443 172.20.36.146:6131' https://mydomain.com/test/Airbus.jpg&

#request image from http/2 server 
#google-chrome --user-data-dir=/tmp/chrome --new-window --no-proxy-server https://172.20.36.146/test/test.jpg&
#google-chrome --user-data-dir=/tmp/chrome --new-window --no-proxy-server https://172.20.36.146/test/Airbus.jpg&

#google-chrome --user-data-dir=/tmp/http_12 --new-window --no-proxy-server https://172.20.36.146:443/test/Thailan.jpg&
#google-chrome --user-data-dir=/tmp/http_22 --new-window --no-proxy-server https://172.20.36.146:445/test/Thailan.jpg&
google-chrome --user-data-dir=/tmp/http_12 --new-window --no-proxy-server https://172.20.36.146:443/test/Airbus.jpg&
google-chrome --user-data-dir=/tmp/http_22 --new-window --no-proxy-server https://172.20.36.146:445/test/Airbus.jpg&

#sh image_test.sh&

sleep 150
#google-chrome --incognito --user-data-dir=/tmp/chrome --new-window --no-proxy-server --enable-quic --origin-to-force-quic-on=quic.clemente.io:443 --host-resolver-rules='MAP quic.clemente.io:443 172.20.36.146:6121' https://quic.clemente.io&
#google-chrome --user-data-dir=/tmp/chrome --new-window --no-proxy-server https://172.20.36.146&

sleep 2

# Turn off 2 chrome client
kill -9  $(pgrep chrome)

# Turn off tcp dump at client
sudo kill -9 $(pgrep tcpdump)
# Turn off tcp dump at server
ssh quoc@172.20.36.146 sh /home/quoc/Test/05_automation_tool/03_performance_multiple_QUIC_TCP/tcpdump_close.sh 

# tshark -nr result.pcapng -T fields -E separator=' ' -e frame.time_delta -e frame.len -e tcp.srcport -e tcp.dstport -e udp.srcport -e udp.dstport > log.txt
# 
# python performance.py

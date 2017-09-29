## ------------------------------------------
## Author: Quoc
## Email: nguyen16@telecom-paristech.fr
## Module: controller
## __________________________________________
# Test 5 MB
# Run server script: setup environment and restart server
ssh quoc@172.20.36.146 sh /home/quoc/Test/05_automation_tool/server_bandwith_5mb_netem.sh&

# Run client script: tcpdump both side, request streaming data, get result
sh /home/quoc/Test/05_automation_tool/client_tcpdump_tshark_analysis.sh

#
# Process and analysis the results
#

# copy pcapng file from server to client side
# mkdir result_server
scp quoc@172.20.36.146:/home/quoc/Test/05_automation_tool/result_server.pcapng /home/quoc/Test/05_automation_tool/result_server

# process result at server side
tshark -nr result_server/result_server.pcapng -T fields -E separator=' ' -e frame.time_delta -e frame.len -e tcp.srcport -e tcp.dstport -e udp.srcport -e udp.dstport > result_server/log_server.txt

# process result at client side
tshark -nr result_client/result_client.pcapng -T fields -E separator=' ' -e frame.time_delta -e frame.len -e tcp.srcport -e tcp.dstport -e udp.srcport -e udp.dstport > result_client/log_client.txt

# Output performance
python performance_client.py&
python performance_server.py&

sleep 10

scp result_server/img.jpg result/result_server_5mb.jpg
scp result_client/img.jpg result/result_client_5mb.jpg
rm result_server/img.jpg
rm result_client/img.jpg
sleep 5
#____________________________________________________
# Test 10 MB
# Run server script: setup environment and restart server
ssh quoc@172.20.36.146 sh /home/quoc/Test/05_automation_tool/server_bandwith_10mb_netem.sh&

# Run client script: tcpdump both side, request streaming data, get result
sh /home/quoc/Test/05_automation_tool/client_tcpdump_tshark_analysis.sh

#
# Process and analysis the results
#

# copy pcapng file from server to client side
# mkdir result_server
scp quoc@172.20.36.146:/home/quoc/Test/05_automation_tool/result_server.pcapng /home/quoc/Test/05_automation_tool/result_server

# process result at server side
tshark -nr result_server/result_server.pcapng -T fields -E separator=' ' -e frame.time_delta -e frame.len -e tcp.srcport -e tcp.dstport -e udp.srcport -e udp.dstport > result_server/log_server.txt

# process result at client side
tshark -nr result_client/result_client.pcapng -T fields -E separator=' ' -e frame.time_delta -e frame.len -e tcp.srcport -e tcp.dstport -e udp.srcport -e udp.dstport > result_client/log_client.txt

# Output performance
python performance_client.py&
python performance_server.py&

sleep 10

scp result_server/img.jpg result/result_server_10mb.jpg
scp result_client/img.jpg result/result_client_10mb.jpg
rm result_server/img.jpg
rm result_client/img.jpg

sleep 5
#______________________________________________

# Test 100 MB
# Run server script: setup environment and restart server
ssh quoc@172.20.36.146 sh /home/quoc/Test/05_automation_tool/server_bandwith_100mb_netem.sh&

# Run client script: tcpdump both side, request streaming data, get result
sh /home/quoc/Test/05_automation_tool/client_tcpdump_tshark_analysis.sh

#
# Process and analysis the results
#

# copy pcapng file from server to client side
# mkdir result_server
scp quoc@172.20.36.146:/home/quoc/Test/05_automation_tool/result_server.pcapng /home/quoc/Test/05_automation_tool/result_server

# process result at server side
tshark -nr result_server/result_server.pcapng -T fields -E separator=' ' -e frame.time_delta -e frame.len -e tcp.srcport -e tcp.dstport -e udp.srcport -e udp.dstport > result_server/log_server.txt

# process result at client side
tshark -nr result_client/result_client.pcapng -T fields -E separator=' ' -e frame.time_delta -e frame.len -e tcp.srcport -e tcp.dstport -e udp.srcport -e udp.dstport > result_client/log_client.txt

# Output performance
python performance_client.py&
python performance_server.py&

sleep 10

scp result_server/img.jpg result/result_server_100mb.jpg
scp result_client/img.jpg result/result_client_100mb.jpg
rm result_server/img.jpg
rm result_client/img.jpg


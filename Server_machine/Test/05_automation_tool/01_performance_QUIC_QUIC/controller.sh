## ------------------------------------------
## Author: Quoc
## Email: nguyen16@telecom-paristech.fr
## Module: controller
## __________________________________________

# Run server script: setup environment and restart server
sh /home/quoc/Test/05_automation_tool/server_bandwith_10mb_netem.sh&

# Run client script: tcpdump both side, request streaming data, get result
ssh quoc@172.20.36.147 sh /home/quoc/Test/05_automation_tool/client_tcpdump_tshark_analysis.sh&

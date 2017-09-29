# We use TC tool
# del = delete
# network interface is eth0

# reset to default configuration
sudo tc qdisc del dev eth0 root

# add = add new configuration to network interface
# 10 000 kbit = 10MB bandwidth between client and server
sudo tc qdisc add dev eth0 root netem rate 10000kbit

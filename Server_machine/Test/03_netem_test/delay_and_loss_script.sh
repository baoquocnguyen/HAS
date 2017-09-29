sudo tc qdisc del dev eth0 root
sudo tc qdisc add dev eth0 root netem delay 100ms loss 5%


sudo tc qdisc del dev eth0 root
sudo tc qdisc add dev eth0 root netem loss 5%


#!/bin/bash

echo run initial script!

# add path for file
# initial environment

export GOPATH=$HOME/work
export PATH=$PATH:$GOPATH/bin  
export GOROOT=/usr/local/go/

# kill process which hold port 6121
# netstat -tulnap
sudo kill -9 $(lsof -t -i:6121)
sudo kill -9 $(lsof -t -i:6131)

# setup network condition delay 100 miliseconds
sudo tc qdisc del dev eth0 root

# add = add new configuration to network interface
# 10 000 kbit = 10MB bandwidth between client and server
sudo tc qdisc add dev eth0 root netem rate 10000kbit

# restart quic_go server
go run /home/quoc/work/src/github.com/lucas-clemente/quic-go/example/main.go -www /var/www/html/&

go run /home/quoc/work/src/github.com/lucas-clemente/quic-go/example/main_port_6131.go -www /var/www/html/&

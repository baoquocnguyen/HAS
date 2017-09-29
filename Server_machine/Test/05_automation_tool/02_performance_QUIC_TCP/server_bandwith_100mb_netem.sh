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

# setup network condition delay 100 miliseconds
sudo tc qdisc del dev eth0 root
sudo tc qdisc add dev eth0 root netem rate 100000kbit


# restart quic_go server
go run /home/quoc/work/src/github.com/lucas-clemente/quic-go/example/main.go -www /var/www/html/

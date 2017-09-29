#!/bin/bash

#
# start
# request image from quic server by quic_go client
go run /home/quoc/work/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:6121/test/Airbus.jpg > text.txt&

# request image from http/2 server by chrome
google-chrome --user-data-dir=/tmp/chrome --new-window --no-proxy-server https://172.20.36.146/test/Airbus.jpg&


# request image from quic server by quic_go client
go run /home/quoc/work/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:6121/test/Airbus.jpg > text.txt&

# request image from http/2 server by chrome
google-chrome --user-data-dir=/tmp/chrome --new-window --no-proxy-server https://172.20.36.146/test/Airbus.jpg&

#!/bin/bash

go run /home/quoc/work/src/github.com/lucas-clemente/quic-go/example/client/main.go https://quic.clemente.io:6121/dash.js/samples/video_source/hal_bbb/bigbuckbunny_750.mp4&

google-chrome --user-data-dir=/tmp/chrome --new-window --no-proxy-server https://172.20.36.146/dash.js/samples/video_source/hal_bbb/bigbuckbunny_750.mp4&


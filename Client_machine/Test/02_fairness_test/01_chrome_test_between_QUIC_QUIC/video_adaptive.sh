
#request image from quic server 
google-chrome --incognito --user-data-dir=/tmp/chrome --new-window --no-proxy-server --enable-quic --origin-to-force-quic-on=quic.clemente.io:443 --host-resolver-rules='MAP quic.clemente.io:443 172.20.36.146:6121' https://quic.clemente.io/hasplayer.js/samples/DemoPlayer/?url=https://quic.clemente.io/dash.js/samples/video_source/demo/manifest.mpd&

#request image from http/2 server 
google-chrome --user-data-dir=/tmp/chrome --new-window --no-proxy-server https://172.20.36.146/hasplayer.js/samples/DemoPlayer/index.html?url=https://172.20.36.146/dash.js/samples/video_source/demo/manifest.mpd&


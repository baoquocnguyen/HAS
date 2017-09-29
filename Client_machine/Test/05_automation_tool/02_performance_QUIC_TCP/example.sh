# Access to the server machine
ssh quoc@172.20.36.146 
"bash -s" <  home/quoc/bash.sh

# Turn off server
# kill -9  $(pgrep go)
# kill $(ps aux | grep go | grep -v "grep" | cut -d " " -f2)

# Setup network condition
#sudo sh /home/quoc/Test/03_netem_test/loss_netem_script_test.sh

# Turn on server
# sh /home/quoc/bash.sh
# go run /home/quoc/work/src/github.com/lucas-clemente/quic-go/example/main.go -www /var/www/html/


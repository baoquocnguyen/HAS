#!/bin/bash

#run test bandwidth at client
#referece at https://openmaniak.com/iperf.php
iperf -c 172.20.36.146 -i 1 -t 60

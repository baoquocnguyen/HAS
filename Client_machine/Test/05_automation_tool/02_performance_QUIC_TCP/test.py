#import subprocess
#subprocess.call(["ls","-l"]);
#subprocess.call(['./test.sh']);
import os

os.system("echo run scripts!")
# or

os.system('sh test.sh')

os.system('sudo tc qdisc del dev eth0 root')

#os.system('sh /home/quoc/Test/03_netem_test/loss_netem_script_test.sh')

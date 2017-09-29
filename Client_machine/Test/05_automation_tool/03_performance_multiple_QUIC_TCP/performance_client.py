'''
Created on 25 juil. 2017

@author: Quoc

Server side log parsing script for QuicGO
'''
import datetime 
import matplotlib.pyplot as plt
import io

##
## initial input and variable
fname = "result_client/log_client.txt"

l_sending_time = []
l_ack_time = []

timeline = 0
time = 0
h2_size = 0
quic_6121_size = 0
quic_6131_size = 0

                
x = []
y = []
z = []
t = []
q = []

##
## Process

with io.open(fname, encoding="iso-8859-1") as f:

    for line in f:

	l_info = line.split()
	if len(l_info) < 21:
		continue
	
	#print(len(l_info),' ',l_info[7],' ',l_info[11])
	#break
	#print(len(l_info),' ',l_info[0])

	time = time + 1
	h2_size = int(l_info[7])
	h2_445_size = int(l_info[11])
	quic_6121_size = int(l_info[15])
	quic_6131_size = int(l_info[19])
	x.append(time)
	y.append(8*h2_size)
	q.append(8*h2_445_size)
#	y.append(l_info[7])
	z.append(8*quic_6121_size)
	t.append(8*quic_6131_size)
#	z.append(l_info[11])
##

##
## output graph
plt.plot(x, y, 'r--', label='h2_throughput')
plt.plot(x, q, 'green', label='h2_445_throughput')
plt.plot(x, z, 'b--', label='quic_6121_throughput')
plt.plot(x, t, 'gray', label='quic_6131_throughput')

plt.xlabel('timeline (in seconds)')
plt.ylabel('Throughput (in bit/sec)')
plt.title('Multiple HTTP/2 and QUIC throughput (client side)')

plt.legend(['HTTP/2_443','HTTP/2_445','QUIC_6121','QUIC_6131'], loc = 'lower right')

plt.savefig('result_client/img.jpg',bbox_inches='tight')
# plt.show()

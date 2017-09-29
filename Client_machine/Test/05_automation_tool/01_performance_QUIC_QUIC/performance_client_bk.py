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
quic_size = 0

                
x = []
y = []
z = []

##
## Process

with io.open(fname, encoding="iso-8859-1") as f:
    for line in f:
	l_info = line.split()
	if len(l_info) < 3: continue
	timeline = timeline + float(l_info[0])
	time = time + float(l_info[0])
	#print(len(l_info),' ',l_info)
	if (int(l_info[2]) == 443) or (int(l_info[3]) == 443):
		h2_size = h2_size + int(l_info[1])

	if (int(l_info[2]) == 6121) or (int(l_info[3]) == 6121):
		quic_size = quic_size + int(l_info[1])
                                           
	if (timeline >= 1):
		x.append(time)
		y.append(h2_size*8)
		z.append(quic_size*8)
		timeline = 0
		#h2_size = 0
		#quic_size = 0
                #print(h2_size*8)

##
## output graph
plt.plot(x, y, 'r--', label='h2_throughput')
plt.plot(x, z, 'b', label='quic_throughput')
plt.xlabel('timeline (in seconds)')
plt.ylabel('Throughput (in bit/sec)')
plt.title('HTTP/2 and QUIC throughput (at client side)')

plt.legend(['HTTP/2','QUIC'], loc = 'lower right')

plt.savefig('result_client/img.jpg',bbox_inches='tight')
# plt.show()

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
fname = "result_server/log_server.txt"

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
	if len(l_info) < 13:
		continue
	
	#print(len(l_info),' ',l_info[7],' ',l_info[11])
	#break
	#print(len(l_info),' ',l_info[0])

	time = time + 1
	h2_size = int(l_info[7])
	quic_size = int(l_info[11])
	x.append(time)
	y.append(8*h2_size)
#	y.append(l_info[7])
	z.append(8*quic_size)
#	z.append(l_info[11])
##
## output graph
plt.plot(x, y, 'r--', label='h2_throughput')
plt.plot(x, z, 'b', label='quic_throughput')
plt.xlabel('timeline (in seconds)')
plt.ylabel('Throughput (in bit/sec)')
plt.title('HTTP/2 and QUIC throughput (at server side)')

plt.legend(['HTTP/2','QUIC'], loc = 'lower right')

#plt.savefig('result_server/img.jpg')
plt.savefig('result_server/img.jpg',bbox_inches='tight')
# plt.show()

import os
import pyshark
from datetime import datetime
import matplotlib.pyplot as plt



cap = pyshark.LiveCapture(interface='ens160')
cap.sniff(timeout=10)
cap

#def graph_pcap():
# 
#	#cap = pyshark.FileCapture('/home/quoc/Test/04_pyshark/test.pcap', only_summaries=True)
#	cap = pyshark.FileCapture('/home/quoc/Test/04_pyshark/test.pcap', only_summaries=True)
#        x = []
#        y = []
#
#        for packet in cap:
#            x.append(float(packet.time))
#            y.append(int(packet.length))
# 
#  	return x, y
time = float(0)
size = int(0)
timeline = int(0)
#cap_pkt = pyshark.FileCapture('/home/quoc/Test/04_pyshark/test.pcap')

def graph_pcap():
	#cap = pyshark.FileCapture('/home/quoc/Test/04_pyshark/test.pcap', only_summaries=True)
	
	#cap = pyshark.FileCapture('/home/quoc/Test/04_pyshark/airbus_test_result.pcapng', only_summaries=True)

	global time
	global size
	global timeline
	x = []
	y = []	
	#for packet in capture.sniff_continuously(packet_count=5):
	for packet in cap:

		
		print 'debug time', packet.transport_layer

		if (packet.protocol == 'UDP'):
			time = time + float(packet.time)
			size = size + int(packet.length)
			timeline = timeline + 1

		if (time > 1000):
			x.append(timeline)
			y.append(size*8)
			time = 0
			size = 0
 
  	return x, y
        


x, y = graph_pcap()

# Draw graph
# print (x)
# print (y)

plt.plot(x, y)
plt.xlabel('Time line')
plt.ylabel('thoughput (bit/s)')
plt.title('Network throughput (second)')

plt.savefig('img.png')
plt.show()

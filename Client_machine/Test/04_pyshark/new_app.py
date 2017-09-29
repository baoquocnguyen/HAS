import os
import pyshark
from datetime import datetime
import matplotlib.pyplot as plt
 
#cap = pyshark.FileCapture('test.pcap')
cap = pyshark.FileCapture('/home/quoc/Test/05_automation_tool/result.pcapng')

x = []
y = []
#time = float(0)
time = int(0)
size = int(0)
timeline = int(0)
tmp = cap[0].sniff_time

def print_conversation_header(packet):
	global x
	global y

	global tmp

	global time
	global size
	global timeline
		
	print(tmp)

	if (packet.transport_layer == 'TCP'):
		#time = time + float(packet.sniff_timestamp) - float(tmp)
		time = time + float(packet.sniff_timestamp) - float(tmp)
		size = size + int(packet.length)
		tmp	= packet.sniff_timestamp

	
	if (time > 10000):
		timeline = timeline + 1
		x.append(timeline)
		y.append(size*8)
		time = 0
		size = 0

		

cap.apply_on_packets(print_conversation_header, timeout=200)

plt.plot(x, y)
plt.xlabel('Time line')
plt.ylabel('thoughput (bit/s)')
plt.title('Network throughput (second)')

plt.savefig('img.png')
plt.show()

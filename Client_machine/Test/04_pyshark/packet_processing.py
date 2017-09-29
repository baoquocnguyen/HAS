import pyshark
import time
#from datetime import datetime
 
cap = pyshark.FileCapture('test.pcap')
a = []
b = []
def print_conversation_header(pkt):
	global a
	global b
	try:
		protocol =  pkt.transport_layer
		src_addr = pkt.ip.src
		src_port = pkt[pkt.transport_layer].srcport
		dst_addr = pkt.ip.dst
		dst_port = pkt[pkt.transport_layer].dstport
		
		print '%s  %s:%s --> %s:%s' % (protocol , src_addr, src_port, dst_addr, pkt.sniff_time.time())
		a.append(pkt.sniff_timestamp)
		b.append(pkt.sniff_timestamp)
	except AttributeError as e:
        #ignore packets that aren't TCP/UDP or IPv4
		pass
	return 1
cap.apply_on_packets(print_conversation_header, timeout=100)
print("####################")
#print(a)
#print(b)


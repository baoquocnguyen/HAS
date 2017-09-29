import pyshark
 
cap = pyshark.FileCapture('test.pcap')

 
#dns_1 = cap[0]

#print(dns_1.captured_length)
#print(dns_1.transport_layer)
#print(dns_1.udp)
#print(dns_1.sniff_time)
#print(dns_1.sniff_timestamp)
for packet in cap:
	protocol = packet.highest_layer
	print(protocol)

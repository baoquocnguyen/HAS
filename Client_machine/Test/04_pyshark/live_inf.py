import pyshark
capture = pyshark.LiveCapture(interface='ens160')
capture.sniff(timeout=10)
capture

for packet in capture.sniff_continuously(packet_count=5):
    print 'Just arrived:', packet
    print '############:', packet['ip'].dst

#def print_callback(pkt):
#    print 'Just arrived:', pkt
#capture.apply_on_packets(print_callback, timeout=5)

#packet['ip'].dst

#packet.ip.src # By protocol attribute

#packet[2].src # By layer index

#cap = pyshark.FileCapture(self._pcap, keep_packets=False, display_filter='http')
#for pkt in capture:
#      print pkt

import pyshark
cap = pyshark.FileCapture('/home/quoc/Test/04_pyshark/test.pcap')
cap
#<FileCapture /home/quoc/Test/01_throughput_test/test_packet/pyshark.pcapng (589 packets)>
print cap[0]

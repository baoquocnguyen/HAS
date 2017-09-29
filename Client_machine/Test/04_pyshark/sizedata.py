import pyshark

cap = pyshark.FileCapture('test.pcap')

nbp = 0
size = 0

for p in cap:
    nbp +=1
    size += int(p.length)

#print "there is {} packet, that's {} kB, and time capture is {}".format(nbp, size, str(cap[nbp-1].sniff_time()))
print "there is {} packet, that's {} kB, and time capture is {}".format(nbp, size)

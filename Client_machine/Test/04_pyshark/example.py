import pyshark
from datetime import datetime

def checkpkt(pak):
 try:
	diff= datetime.today()-pak.sniff_time
	print "now: %s time: %s diff: %s" % (str(datetime.today()), str(pak.sniff_time), str(diff))
	if (pak.ranap.procedureCode=="19"):
		print "time: %s now: %s" % (str(pak.sniff_time), datetime.today())
 except (AttributeError, TypeError):
 	pass

capture = pyshark.LiveCapture(interface='ens160',display_filter='bssap')
capture.sniff(timeout=5)

for pkt in capture.sniff_continuously():
	checkpkt(pkt)

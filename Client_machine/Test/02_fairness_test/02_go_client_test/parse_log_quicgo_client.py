'''
Created on 25 juil. 2017

@author: yiping

Server side log parsing script for QuicGO
'''
import datetime 
import io

fname = "log.txt"

        
l_sending_time = []
l_ack_time = []

with io.open(fname, encoding="iso-8859-1") as f:
    expected_number = 0
    previous_number = 0
    l_lost_packet = []
    for line in f:
        l_info = line.split()
        if len(l_info) < 2: continue
        if l_info[1]=="<-" and l_info[2]=="Reading":  #server sending packet
            packet_timestamp = datetime.datetime.strptime(l_info[0], "%H:%M:%S.%f")
            packet_number = int(l_info[4], 16)
            print(packet_number) 
            if previous_number < packet_number:
            	expected_number = expected_number + 1
            else:
                continue
		
            previous_number = packet_number
            if packet_number > expected_number:
                print("missing packet: %s %s" % (expected_number, hex(expected_number)))
                print(line) 
                l_lost_packet.append(expected_number)
                expected_number = packet_number
print(l_lost_packet)
print(len(l_lost_packet))
#print(packet_number)

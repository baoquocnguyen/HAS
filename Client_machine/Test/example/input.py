import os
import sys

def long_slice():


    fileName="this.txt"
    result=open(fileName, "w")
    result.close()
    result=open(fileName, "a")

    for slice in range(100):
        result.write("{\"url\":\"https://sites/"+str(slice)+"\"},\n")

if __name__ == '__main__':

	long_slice() 

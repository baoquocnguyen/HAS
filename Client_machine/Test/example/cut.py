from __future__ import division
from PIL import Image
import math
import os
import sys

def long_slice(image_path, out_name, outdir, slice_size, nb):
    """slice an image into parts slice_size tall"""
    img = Image.open(image_path)
    width, height = img.size
    upper = 0
    left = 0
    #slices = int(math.ceil(height/slice_size))
    slices = int(nb)
    count = 1


    fileName=nb+"/index.html"
    result=open(fileName, "w")
    result.close()
    result=open(fileName, "a")

    for slice in range(slices):
        #if we are at the end, set the lower bound to be the bottom of the image
        if count == slices:
            lower = height
        else:
            lower = int(count * slice_size)
        #set the bounding box! The important bit     
        bbox = (left, upper, width, lower)
        working_slice = img.crop(bbox)
        upper += slice_size
        #save the slice
        working_slice.save(os.path.join(outdir, "slice_" + out_name + "_" + str(count)+".jpg"))
        result.write("<img src=\"slice_eggs_"+str(count)+".jpg\" alt=\"Ubuntu Logo\" class=\"floating_element\"/>")
        count +=1

if __name__ == '__main__':
    #slice_size is the max height of the slices in pixels

    print sys.argv
    long_slice("ab.jpg","eggs", os.getcwd()+"/"+sys.argv[1], int(1800/int(sys.argv[1])), sys.argv[1])


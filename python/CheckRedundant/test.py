
###
# This script accepts  a list of directories, then walks through all files in 
# these pathes, and find any duplicated files
# The result is saved to res.txt in cwd


import os
import sys
import filecmp
from collections import OrderedDict

rootdirs = [ "f:\lyq" ]

resFile = "res.txt"

# read priority
priority = open("priority.txt", "r").read().split()
print priority
#sys.exit(0)

INV_VAL = 0XFFFF
def getkey(inputStr):
    for item in priority:
        ind = priority.index(item)
        if inputStr.find(item) != -1:
            return priority.index(item)  
    return INV_VAL;


###
# The list can sort with my algorighm
# if yes or no
def CanSort(arr):
    for a in arr:
        if getkey(a) == INV_VAL:
            return False
    return True


inputs = open("input.txt", 'r').read().split()
for str in inputs:
    print getkey(str)

print sorted(inputs, key=getkey)

print CanSort(inputs)

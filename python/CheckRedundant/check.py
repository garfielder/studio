
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


fpRes = open(resFile, "w")
if fpRes is None:
    print ("Failed to open file " + resFile)

fpBad = open("bad.txt", "w")
print ("Differnt files are")
files = OrderedDict()
for root in  rootdirs:
    for dirpath, dirnames, filenames in os.walk(root):
        for filepath in filenames:
            filename =  os.path.join(dirpath, filepath)
            basename =  os.path.basename(filename)
            if basename not in files.keys():
                #print("Adding %s " % filename)
                files[basename] = [filename]
            else:
                if (filecmp.cmp(files[basename][0], filename)):
                    files[basename].append(filename)
                    print  ("redundant> existing: %s  new is %s"  % (files[basename], filename))
                else:
                    print  ("unexpected files >  %s  is %s"  % (files[basename], filename))
                    print >>fpBad, "%s\t\t%s"  % (files[basename][0], filename)
                    

for fname in files:
    alternatives = files[fname]
    alternatives = sorted(alternatives, key=getkey)
    oneline = ""
    if (len (alternatives) > 1):
        for file in alternatives:
            if (alternatives.index(file) > 0):
                oneline += "echo " + file + "\n"
                oneline += "del " + file + "\n"
                os.remove(file)
            else:
                oneline += "keep " + file + "\n"

    print >>fpRes, oneline
fpRes.close()

###
# Verify that no files are lost
needGolden = False 
goldenName = "golden.txt"
if (needGolden):
    fpGolden = open(goldenName, "w")
    for file in files:
        print >> fpGolden, file
    fpGolden.close()

###
# compare with golden
listName = "files.txt"
fpList = open(listName, "w")
for file in files:
    print >>fpList, file
fpList.close()

if filecmp.cmp(goldenName, listName):
    print "No files are lost"
else:
    print "some files lost"



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
    oneline = ""
    if (len (files[fname]) > 1):
        for file in files[fname]:
            oneline += file + "\t\t"
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


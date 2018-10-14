
###
# This script accepts  a list of directories, then walks through all files in 
# these pathes, and find any duplicated files
# The result is saved to res.txt in cwd


import os
import filecmp

rootdirs = [ "f:\lyq" ]

resFile = "res.txt"

fpRes = open(resFile, "w")
if fpRes is None:
    print ("Failed to open file " + resFile)
print ("Differnt files are")
files = {}
for root in  rootdirs:
    for dirpath, dirnames, filenames in os.walk(root):
        for filepath in filenames:
            filename =  os.path.join(dirpath, filepath)
            basename =  os.path.basename(filename)
            if basename not in files.keys():
                #print("Adding %s " % filename)
                files[basename] = filename
            else:
                print >>fpRes, ("redundant> existing: %s  new is %s"  % (files[basename], filename))


###
# Verify that no files are lost
needGolden = True
if (needGolden):
    goldenName = "golden.txt"
    fpGolden = open(goldenName, "w")
    for file in files:
        print >> fpGolden, file
    fpGolden.close()

###
# compare with golden
listName = "files.txt"
fpList = open(listName, "w")
for file in files:

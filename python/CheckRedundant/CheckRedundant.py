
###
# This script accepts  a list of directories, then walks through all files in 
# these pathes, and find any duplicated files
# The result is saved to res.txt in cwd


import os

rootdirs = [ "d:\\studio", 
           ]

resFile = "res.txt"

fpRes = open(resFile, "w")

files = {}
for root in  rootdirs:
    for dirpath, dirnames, filenames in os.walk(root):
        for filepath in filenames:
            filename =  os.path.join(dirpath, filepath)
            basename =  os.path.basename(filename)
            if basename not in files.keys():
                print("Adding %s " % filename)
                files[basename] = filename
            else:
                print("redundant> existing: %s  new is %s"  \
                % (files[basename], filename), file = fpRes)

     

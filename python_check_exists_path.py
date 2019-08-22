#!/usr/bin/python

import os.path, pdb

strFilename= "FILE_DIR"
parser = optparse.OptionParser()

parser.add_option('-a', '--abc', dest='str1', default="", help= 'help for str1')
.
.
.

(options, args) = parser.parse_args()

pdb.set_trace()
if options.str1 != "":
    if not os.path.exists(options.str1):
        print "File " + options.str1 + " not found, please check it!"
print "--------------------------------------------------------------------"



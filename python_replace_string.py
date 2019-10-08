import os
import subprocess

print "start replacement"
subprocess.call("replace.sh '%s'"% arg)
print "end replacement"

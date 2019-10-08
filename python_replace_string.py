import os
import subprocess
arg="./"
print ("start replacement")
subprocess.call("replace.sh '%s'"% arg)
print ("end replacement")

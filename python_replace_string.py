 import os
 import subprocess

 arg="/home/ucu1hc/Downloads/Workspace_201909xx/test1/_data_to_replace"
 #print ("start replacement")
 #subprocess.call("replace.sh '%s'"% arg)
 subprocess.call(['chmod', '-R', '777', 'replace.sh'])
 print '%s'%str(arg)
 subprocess.call(['sh','./replace.sh',str(arg)])
 #output = subprocess.Popen(['bash','-c','./replace.sh',arg],shell=True,stderr=subprocess.PIPE)
 #print output.communicate()
 #print ("end replacement")

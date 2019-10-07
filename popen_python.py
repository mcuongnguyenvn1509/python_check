import subprocess
import shlex
argshlex=shlex.split('grep -rlw "Generated file" --include=*.{h,cpp}')

print (argshlex)

grep_process=subprocess.Popen(["grep", "-rlw", "Generated file", "--include=*.{h,cpp}"],stdout=subprocess.PIPE)
cat_process=subprocess.Popen(["cat"], stdin=grep_process.stdout, stdout=subprocess.PIPE)
output= cat_process.communicate()[0]
print(output.decode())

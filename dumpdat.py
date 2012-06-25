import sys
import struct

data = open(sys.argv[1], "r").read()
x = []
for i in range(0,len(data),2):
  x.append(struct.unpack_from(">H", data, i)[0])

while x[-1] == 0:
  x = x[:-1]

collimit = 45
col = "dat "
for d in x:
  col2 = col+str(d)+','
  if len(col2) >= collimit:
    print col[:-1]
    col = "dat "+str(d)+','
  else:
    col = col2

print col[:-1]


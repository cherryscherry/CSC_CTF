#!/usr/bin/env python3 
import base64

dic = {}
for i in  range ( 1 , 17 ):
    s = 'a' * i
    for _ in  range (i):
        s = base64.b64encode(s.encode()).decode()
    dic[ len (s)] = i

with  open ( 'encoded_flag.txt' , 'r' ) as f:
    enc = f.read()


lengths = [__REDACTED__]

flag = b''

index = 0 
for i in  range ( len (lengths)):
    l = lengths[i]
    seg = enc[index:index + l]
    for _ in  range (dic[l]):
        seg = base64.b64decode(seg)
    flag += seg
    index += l

flag = flag.decode()
print (flag)

# len(lengths) = 8
# len(flag) = 21
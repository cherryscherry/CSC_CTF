import base64

# Dictionary
dic = {4: 1, 8: 2, 12: 3, 24: 4, 32: 5, 44: 6, 80: 7, 108: 8, 144: 9, 256: 10, 344: 11, 460: 12, 800: 13, 1068: 14, 1424: 15, 1960: 16}

# Encrypted content
enc = "VVRGU1J3PT0=ew==VkZSQk1XRnJNVUpRVkRBOQ==ZA==VkZaak1WTkZiRUpRVkRBOQ==TVRVPQ==VTFWV1lVMVdVbkJTVkRBOQ==fQ=="

# Decode segments based on their length and concatenate them
flag = b''
index = 0

segments = [12, 4, 24, 4, 24, 8, 24, 4]  # obtained by observing the enc variable

for segment_length in segments:
    seg = enc[index:index + segment_length]
    num_encodes = dic[segment_length]
    for _ in range(num_encodes):
        seg = base64.b64decode(seg)
    flag += seg
    index += segment_length

print(f"Decoded flag: {flag.decode()}")
## Crypto Challenge
### Decipher
ChatGPT 
Prompt - Welcome to the qualification round of the Cyber Security Challenge. Jump into the zigzag journey by cracking the following cipher: WSeCClo2cT0oe2m2. What is the flag. and explain how you got to it.
Response
WSeCClo2cT0oe2m2

If we break it apart by numbers, we get:

- WSeCClo2
- cT0
- oe2
- m2

Let's focus on the "zigzag" hint. If we arrange the characters in a zigzag pattern based on the numbers, it might give us a hint:
```
WSeCClo2 
	cT0 
		oe2 
			m2
```
Reading vertically, we get: "Welcome to C2SC2022."
So, the flag might be: **C2SC2022** or **Welcome to C2SC2022**.
This line of thinking was wrong but it helped me spot the answer nonetheless.
Flag - WelcomeToCSC2022

## Password Cracking
### Crack The Hash
https://hashes.com/en/tools/hash_identifier
Results - f11fb5dc7f46526bad57cf754dd1e531f8dfde1ab7bd7eac917d00a8 - vecna - Possible algorithms: SHA224, Keccak-224
Flag - vecna

## Image Challenge
### Logo
I could see the flag in plain view already and just increased contrast in my default image editing app to make it more visible.
Flag - CTF{Well that data was well hidden.}

## Cipher Challenge
### Layers
I first did a base64 decoding
Result - $EC2?86C%9:?8D
and I then did a ROT47 Caesar Cipher
Flag - StrangerThings

### Factory
Downloaded Yafu and ran the following command
`.\yafu-x64-gc.exe "factor(21740962110328230832239032656649610932068604557)"`
result ```
```
fac: factoring 21740962110328230832239032656649610932068604557
fac: using pretesting plan: normal
fac: no tune info: using qs/gnfs crossover of 95 digits
fac: no tune info: using qs/snfs crossover of 95 digits
div: primes less than 10000
fmt: 1000000 iterations
rho: x^2 + 3, starting 1000 iterations on C47
rho: x^2 + 2, starting 1000 iterations on C47
rho: x^2 + 1, starting 1000 iterations on C47
pm1: starting B1 = 150K, B2 = gmp-ecm default on C47

starting SIQS on c35: 96105719717210549486910438869509369
Total factoring time = 0.2954 seconds


***factors found***

P12 = 226219232053
P35 = 96105719717210549486910438869509369

ans = 1
```
Flag - CTF{226219232053_96105719717210549486910438869509369}

## Network Capture Challenge
### Camouflage
I opened the network dump in Wireshark then noticed that it was transferring html. I decided to export all the files sent.
After opening them 1 by 1, I noticed a main.html which contained the username and password. 
The password was URI encoded which I decoded and Base64 decoded as well.
Flag - KN1Z6PXVy9

## Network Data Challenge
### Just Keep Typing
I originally opened my capture in Wireshark when I noticed the only values that changed were the IDs and the Leftover Capture Data. I figured since it was USB protocol, I should look up how to decipher it. I found a helpful tutorial from https://blog.stayontarget.org/2019/03/decoding-mixed-case-usb-keystrokes-from.html which included a script to map the leftover capture data to keypresses. I then exported the data into a csv and separated out all the Leftover Capture data as a TXT and ran the script. 
Flag - flag{pr355_0nwards_3a10134e}

### Find The Flag
#### **Understanding the Packet Structure**:

#### Ethernet Header:
- Every Ethernet frame starts with a 14-byte header. This includes the source and destination MAC addresses and the EtherType field.

#### IP Header:
- After the Ethernet header, you will find the IP header. Assuming it doesn't have any options, this header is 20 bytes long.

#### TCP Header:
- The TCP header starts after the IP header. Within the TCP header:
  - The 13th byte contains the higher-order bits of the TCP flags.
  - The following (or 14th byte's starting bits) could contain the lower-order bits, but commonly used TCP flags are confined within the 13th byte.

### 2. **Python Implementation**:

#### Convert Hex Dump to Bytes:
```python
data = bytes.fromhex(hex_dump)
```
The `fromhex()` method of the `bytes` class takes a hexadecimal string and converts it into a bytes object. The `data` variable now holds the binary representation of the hex dump.

#### Locating the TCP Flags:
```python
tcp_header_start = 14 + 20  # Ethernet header + IP header
tcp_flags_byte = data[tcp_header_start + 13]
```
- `tcp_header_start` calculates where the TCP header starts. As mentioned, the Ethernet header is 14 bytes, and the IP header is 20 bytes. So the TCP header starts 34 bytes into the packet.
  
- By adding 13 to this starting position, we index into the byte that contains the TCP flags.

#### Extracting and Formatting Flags:
```python
return tcp_flags_byte
```
After extracting the flags, the function returns them. The byte can be represented as an integer value, where each bit corresponds to a flag.

#### Print Result:
```python
print(f"0x{flags:03X}")
```
This line formats the flags as a hexadecimal string. The `:03X` inside the f-string is a format specifier:
- `X` means to format as uppercase hexadecimal.
- `03` means to pad with zeros to ensure at least three characters.

### **Why This Works**:
This approach works because the Ethernet, IP, and TCP headers have standardized structures. By understanding these structures, you can precisely locate and extract specific fields, such as the TCP flags.

The Python code then uses the knowledge of this structure to extract the relevant byte (TCP flags) from the hex dump. Given that the commonly used TCP flags are URG, ACK, PSH, RST, SYN, and FIN, which are all within a single byte (the 13th byte of the TCP header), we can obtain all the information we need from this byte.

The extraction is done without needing to individually test each flag because the goal was to present the byte as a hex value (0xXXX format). If one needed the status of individual flags, they could use bitwise operations to test each flag, as demonstrated in the earlier solution.

## Identify The Attack
```
hex_dump = "0adc27b619b40af933fabd4908004500002836e300002506fc4bac1e0042341e8223b3348011bd4b0250000000005029040056380000"

def extract_tcp_flags(hex_dump):
    # Convert the hex dump to bytes
    data = bytes.fromhex(hex_dump)

    # Extract TCP flags from the TCP header
    tcp_header_start = 14 + 20  # Ethernet header + IP header
    tcp_flags_byte = data[tcp_header_start + 13]

    # Define flags
    flags = {
        'URG': (tcp_flags_byte & 0b00100000) != 0,
        'ACK': (tcp_flags_byte & 0b00010000) != 0,
        'PSH': (tcp_flags_byte & 0b00001000) != 0,
        'RST': (tcp_flags_byte & 0b00000100) != 0,
        'SYN': (tcp_flags_byte & 0b00000010) != 0,
        'FIN': (tcp_flags_byte & 0b00000001) != 0
    }
    return flags

flags = extract_tcp_flags(hex_dump)
print(flags)
```

Result `{'URG': True, 'ACK': False, 'PSH': True, 'RST': False, 'SYN': False, 'FIN': True}`
The **Xmas scan** or **Xmas tree scan** is a type of TCP port scan used to identify listening ports on the target system. The name "Xmas" comes from the fact that the flags light up the packet like a Christmas tree.

**How does the Xmas scan work?**

The attacker sends a TCP frame with the URG, PSH, and FIN flags set to the target machine. According to the TCP RFC, if the port is closed, the target should respond with an RST packet, indicating the port is closed. If there's no response from the target, the port can be inferred as open or filtered.

**Why is this technique used?**

1. **Stealth**: Traditional scans can be easily detected. However, the Xmas scan, by using a non-standard combination of flags, can sometimes evade basic detection techniques or confuse intrusion detection systems (IDS).
    
2. **Efficiency**: The Xmas scan is stateless from the attacker's perspective. They don't need to keep track of the connection state, making it faster and consuming less memory on the attacker's side.
    

**So why is the combination URG, PSH, and FIN indicative of an Xmas scan?**

The TCP protocol specification (RFC 793) does not define any specific action for packets with this unusual combination of flags. So, by the book, if a service receives a packet with these flags set and the port is closed, it should send an RST packet in response. If the port is open, typically, there's no response at all.

It's the non-standard nature of this flag combination that makes it interesting for attackers. Most standard communication doesn't involve packets with just the URG, PSH, and FIN flags set, so seeing this combination can be a strong hint of an Xmas scan in progress.

## OSINT
### Beautiful House
I dropped the image into Google Lens. Then searched by the keywords shown on the image "The Rectory". I went to each result one by one and visited their google maps street view. I eventually got to The Rectory Simons Town and the TripAdvisor had the name of the architect. I went to his Wikipedia page and found the name of his cousin whom he married.
Flag - Florence Edmeades

### Heritage
Unscramble the message
```
hex_message = "534148524120392f322f3030332f30303139"
ascii_message = bytes.fromhex(hex_message).decode('utf-8')

print(ascii_message)
```

Result `SAHRA 9/2/003/0019`

A quick google search revealed that the full Site Name is Old Military Hospital, Rhodes University, Grahamstown. I found this on https://sahris.sahra.org.za/sites/920030019 which also contained a downloadable PDF Which contained the current department of the building.

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

## Network Challenge
I opened the network dump in Wireshark then noticed that it was transferring html. I decided to export all the files sent.
After opening them 1 by 1, I noticed a main.html which contained the username and password. 
The password was URI encoded which I decoded and Base64 decoded as well.
Flag - KN1Z6PXVy9
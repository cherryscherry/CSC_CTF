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
### Camouflage
I opened the network dump in Wireshark then noticed that it was transferring html. I decided to export all the files sent.
After opening them 1 by 1, I noticed a main.html which contained the username and password. 
The password was URI encoded which I decoded and Base64 decoded as well.
Flag - KN1Z6PXVy9

## Network Challenge
### Just Keep Typing
I originally opened my capture in Wireshark when I noticed the only values that changed were the IDs and the Leftover Capture Data. I figured since it was USB protocol, I should look up how to decipher it. I found a helpful tutorial from https://blog.stayontarget.org/2019/03/decoding-mixed-case-usb-keystrokes-from.html which included a script to map the leftover capture data to keypresses. I then exported the data into a csv and separated out all the Leftover Capture data as a TXT and ran the script. 
Flag - flag{pr355_0nwards_3a10134e}

## OSINT
### Beautiful House
I dropped the image into Google Lens. Then searched by the keywords shown on the image "The Rectory". I went to each result one by one and visited their google maps street view. I eventually got to The Rectory Simons Town and the Tripadvisor had the name of the architect. I went to his Wikipedia page and found the name of his cousin whom he married.
Flag - Florence Edmeades


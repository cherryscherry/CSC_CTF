from scapy.all import *

# Your hex data
hex_data = "0adc27b619b40af933fabd4908004500002836e300002506fc4bac1e0042341e8223b3348011bd4b0250000000005029040056380000"
byte_data = bytes.fromhex(hex_data)

# Create an IP packet from the byte data
packet = IP(byte_data)

# Write the packet to a pcap file
wrpcap("output.pcap", packet)

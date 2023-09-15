def decode_flag():
    with open("flag.enc", "r") as infile:
        flag_enc = infile.read()
        flag_dec = ""

        for each in flag_enc:
            flag_dec += chr(ord(each) ^ 0x66)

    with open("decoded_flag.txt", "w") as outfile:
        outfile.write(flag_dec)

    print("Decoded flag saved to decoded_flag.txt")


if __name__ == "__main__":
    decode_flag()

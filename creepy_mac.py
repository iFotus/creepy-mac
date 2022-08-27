#!/bin/bash

import subprocess
import string
import random
import re


def get_random_mac_address():
    uppercased_hexdigits = ''.join(set(string.hexdigits.upper()))
    mac = ""
    for i in range(6):
        for j in range(2):
            if i == 0:
                mac += random.choice("02468ACE")
            else:
                mac += random.choice(uppercased_hexdigits)
        mac += ":"
    return mac.strip(":")


def get_current_mac_address(iface):

    output = subprocess.check_output(f"ifconfig {iface}", shell=True).decode()
    return re.search("ether (.+) ", output).group().split()[1].strip()
    


def change_mac_address(iface, new_mac_address):

    subprocess.check_output(f"ifconfig {iface} down", shell=True)
    
    subprocess.check_output(f"ifconfig {iface} hw ether {new_mac_address}", shell=True)

    subprocess.check_output(f"ifconfig {iface} up", shell=True)
    

if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser(description="Creepy Mac")
    parser.add_argument("interface", help="The network interface name on Linux")
    parser.add_argument("-r", "--random", action="store_true", help="Whether to generate a random MAC address")
    parser.add_argument("-m", "--mac", help="The new MAC you want to change to")
    parser.add_argument("-c", "--cmac", help="show the current MAC address")
    args = parser.parse_args()
    iface = args.interface
    if args.random:
        new_mac_address = get_random_mac_address()
    elif args.mac:
        new_mac_address = args.mac
    old_mac_address = get_current_mac_address(iface)
    print("[*] Old MAC address:", old_mac_address)
    change_mac_address(iface, new_mac_address)
    new_mac_address = get_current_mac_address(iface)
    print("[+] New MAC address:", new_mac_address)
    
      

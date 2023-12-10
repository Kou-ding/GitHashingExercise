#!/bin/bash

# input gets assigned to whatever the read command got:
read -p "Enter a 4-digit integer number: " input
# =~:regex matching operator, ^...$:anchors regex at the beginning and end of the string
# [...]:declares the range the string's characters can get, {4}:declares the number of instances of [...]
if [[ $input =~ ^[0-9]{4}$ ]]; then
  # using cut to keep the first 4 digits of the hash:
  hex_hash=$(echo -n "$input" | sha256sum | cut -c1-4)
  dec_hash=$(printf "%d\n" "0x$hex_hash" | cut -c1-4)
else
  echo "Invalid input. Please enter a 4-digit integer number."
fi
# prints hash output
echo "Generated 4-digit decimal hash: $hex_hash"
echo "Generated 4-digit hexadecimal hash: $dec_hash"
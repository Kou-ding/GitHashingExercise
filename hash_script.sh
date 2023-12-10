#!/bin/bash

# Function to generate a hash for a user input
generate_hash() {
  read -p "Enter a 4-digit number: " input
  # Check if the input is a 4-digit number
  if [[ $input =~ ^[0-9]{4}$ ]]; then
    echo -n "$input" | md5sum | cut -c1-4
  else
    echo "Invalid input. Please enter a 4-digit number."
  fi
}

# Example: Generate a hash for user input
result=$(generate_hash)
echo "Hash: $result"

#!/bin/bash

kaprekar_routine() {
    num=$1
    iterations=0

    echo "Starting Kaprekar's routine for: $num"

    while [ "$num" -ne 6174 ]; do
        num=$(printf "%04d" "$num")

        asc=$(echo "$num" | grep -o . | sort | tr -d '\n')

        desc=$(echo "$num" | grep -o . | sort -r | tr -d '\n')

        small=$((10#$asc))
        large=$((10#$desc))

        num=$((large - small))

        ((iterations++))

        echo "Iteration $iterations: $large - $small = $num"

        if [ "$num" -eq 6174 ]; then
            echo "Kaprekar's constant reached: 6174 in $iterations iterations."
            break
        fi

        if [ "$num" -eq 0 ]; then
            echo "Kaprekar's routine is not applicable for this number."
            break
        fi
    done
}

# Read input from user
read -p "Enter a 4-digit number: " input

# Case 1: Check if input is exactly 4 digits and numeric
if [[ ! "$input" =~ ^[0-9]{4}$ ]]; then
    echo "Error: Please enter a valid 4-digit number (0000-9999)."
    exit 1
fi

# Case 2: Check if all digits are the same (like 1111, 2222) - Kaprekar's routine is not applicable
if [[ "$input" =~ ^([0-9])\1{3}$ ]]; then
    echo "Error: All digits are the same. Kaprekar's routine does not apply."
    exit 1
fi

# Call the function
kaprekar_routine "$input"

#Added Line 1
#Added Line 2
#Added Line 3
#Added Line 4
#Added Line 5
#Added Line 6
#Added Line 7
#Added Line 8
#Added Line 9
#Added Line 10

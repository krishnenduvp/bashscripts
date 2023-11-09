#!/bin/bash

# Get a list of usernames from /etc/passwd
usernames=$(awk -F: '/^[^#]/ {print $1}' /etc/passwd)

# Iterate through each username and check for expiration
for user in $usernames; do
    # Get account aging information using chage
    aging_info=$(chage -l $user 2>/dev/null)

    # Check if the account is expired
    if [[ $aging_info == *"Account expires"* ]]; then
        echo "User $user is expired:"
        echo "$aging_info"
        echo "------------------------"
    fi
done
#!/bin/bash
awk -F: '{ system("chage -l "$1" | grep 'Password expires'") }' /etc/shadow | grep -v 'never' | grep -v 'Password expires'

# Get a list of usernames from /etc/passwd
usernames=$(awk -F: '/^[^#]/ {print $1}' /etc/passwd)

# Iterate through each username and check for expiration
for user in $usernames; do
    # Get account aging information using chage
    aging_info=$(chage -l $user 2>/dev/null)

    # Check if the account is expired
    if [[ $aging_info == *"Account expires"* && $aging_info != *"never"* ]]; then
    echo "User $user is expired:"
        echo "$aging_info"
        echo "------------------------"
    fi
done

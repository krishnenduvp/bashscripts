#!/bin/bash
# Can be used to Encrypt/Decrypt String using the mfvault file
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
echo -n "KrisHY76HJFFRrte6" > mfvault

while true; do
read -erp "Do you want to Encrypt/Decrypt String [Ee|Dd] : " choice
case $choice in
     [Dd]* )
           echo "Paste the key and hit Enter, ctrl-d when done"
           keyvariable=$(cat)
cat > password.yml << EOF
---
mypassword: !vault |
$keyvariable
EOF
          ansible localhost -m debug -a var="mypassword" -e "@password.yml" --vault-id mfvault
         find $DIR -name password.yml -delete
break;;
     [Ee]* )
           echo "Enter String to Encrypt and hit ctrl-d 2 times !!"
ansible-vault encrypt_string --vault-id so@mfvault --stdin-name 'password'
break;;
        * ) echo -e "Wrong input [Ee|Dd]..exiting \n"
            exit 8;;
esac
done

find $DIR -name mfvault -delete


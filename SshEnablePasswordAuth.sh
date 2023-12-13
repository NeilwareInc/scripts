#!/bin/bash

# If via user_data, will run as root so no "sudo" needed

# Some variables
config_file="/etc/ssh/sshd_config"
search_string="PasswordAuthentication no"
replace_string="PasswordAuthentication yes"

# Change "no" to "yes" in /etc/ssh/sshd_config
sudo sed -i "s/${search_string}/${replace_string}/" "$config_file"

# Restart sshd service
sudo systemctl restart sshd
# sudo service sshd restart


## Assign password to user to test password authentication during login

username="ubuntu"   #Change to preferred user
password="1234567890" #Change to preferred password

# Set the password for the user
sudo echo -e "$password\n$password" | sudo passwd "$username"

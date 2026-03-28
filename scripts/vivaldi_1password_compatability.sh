#!/bin/bash

set -e

echo "Setting up Vivaldi as a 1Password custom allowed browser..."

sudo mkdir -p /etc/1password
printf "vivaldi-bin\nvivaldi\nvivaldi-stable\n" | sudo tee /etc/1password/custom_allowed_browsers >/dev/null
sudo chown root:root /etc/1password/custom_allowed_browsers
sudo chmod 755 /etc/1password/custom_allowed_browsers

echo "Done. 1Password and Vivaldi should work together now!"

#!/bin/bash

set -e

echo "Enabling Hyprland Polkit Agent..."
systemctl --user enable --now hyprpolkitagent.service

echo "Enabling Bluetooth..."
systemctl enable --now bluetooth.service

echo "Enabling Docker..."
systemctl enable --now docker.service

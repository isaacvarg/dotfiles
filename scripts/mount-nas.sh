#!/bin/bash
CRED_FILE="/run/user/$(id -u)/nas-creds"

OP_USER=$(op item get "nas-credentials" --fields username 2>/dev/null)
OP_PASS=$(op item get "nas-credentials" --fields password --reveal 2>/dev/null)

if [[ -z "$OP_USER" || -z "$OP_PASS" ]]; then
  echo "Failed to fetch NAS credentials from 1Password"
  exit 1
fi

# save creds to ram
printf "username=%s\npassword=%s\n" "$OP_USER" "$OP_PASS" >"$CRED_FILE"
chmod 600 "$CRED_FILE"

# fetch chares config
SHARE_CONFIG=$(op item get "nas-shares-config" --fields label=config --format=json | jq -r '.value' | jq . 2>/dev/null)

if [[ -z "$SHARE_CONFIG" ]]; then
  notify-send "NAS Mount" "Failed to fetch share config from 1Password" --urgency=critical
  rm -f "$CRED_FILE"
  exit 1
fi

# variables for shares
SERVER=$(echo "$SHARE_CONFIG" | jq -r '.server')
SHARE_NAMES=$(echo "$SHARE_CONFIG" | jq -r '.shares[]')

# mount each share
while IFS= read -r name; do
  mountpoint="/mnt/$name"
  sudo mkdir -p "$mountpoint"
  if ! mountpoint -q "$mountpoint"; then
    sudo mount -t cifs "//${SERVER}/${name}" "$mountpoint" \
      -o credentials="$CRED_FILE",noserverino,uid=1000,gid=1000
  fi
done <<<"$SHARE_NAMES"

rm -f "$CRED_FILE"
notify-send "NAS Mount" "All shares mounted successfully."

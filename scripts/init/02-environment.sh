#!/bin/bash

# ┌────────────┐
# │ ＳＨＥＬＬ │
# └────────────┘
#
# i have been liking zsh so no reason
# to switch to something else

echo "Checking default shell..."
if [ "$SHELL" != "/usr/bin/zsh" ]; then
  echo "Changing shell to zsh..."
  chsh -s /usr/bin/zsh
else
  echo "✅ Default shell is already zsh."
fi

# ┌──────────────────┐
# │ ＮＡＳ  ＳＵＤＯ │
# └──────────────────┘
#
# allows us to run our mount-nas script without sudo
# so we can run it on startup

SUDOERS_FILE="/etc/sudoers.d/nas-mount"
if [ ! -f "$SUDOERS_FILE" ]; then
  echo "Creating sudoers rule for mount-nas script without password..."
  echo "$USER ALL=(ALL) NOPASSWD: /home/$USER/.local/bin/mount-nas" | sudo tee "$SUDOERS_FILE" >/dev/null
  sudo chmod 0440 "$SUDOERS_FILE"
else
  echo "✅ NAS sudoers rule already exists."
fi

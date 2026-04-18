#!/bin/bash

# this nifty script makes it so I don't have to manually go edit my
# chezomi /packages files to add a package
# can use arguments to tell which type of package or interactive mode

PACKAGES_DIR="$(chezmoi source-path)/packages"

# making sure dir exists
mkdir -p "$PACKAGES_DIR"

# worker function to add the package
add_package() {
  local type=$1
  local pkg=$2
  local file="$PACKAGES_DIR/$type"

  if [ -z "$pkg" ]; then
    echo "Error: No package name provided for $type."
    exit 1
  fi

  # make sure its not dup
  if grep -Fxq "$pkg" "$file" 2>/dev/null; then
    echo "󱠐 '$pkg' is already in your $type list."
  else
    echo "$pkg" >>"$file"
    echo "󰄬 Added '$pkg' to $file"
  fi
}

# function to use the script interactively instead of by args
interactive_mode() {
  echo "Select package type:"
  options=("pacman" "aur" "flatpak" "Quit")
  select opt in "${options[@]}"; do
    case $opt in
    "pacman" | "aur" | "flatpak")
      read -p "Enter $opt package name: " pkg_name
      add_package "$opt" "$pkg_name"
      break
      ;;
    "Quit")
      exit 0
      ;;
    *) echo "Invalid option $REPLY" ;;
    esac
  done
}

# flag/arg parsing for non-interactive mode
while getopts "p:a:f:i" opt; do
  case $opt in
  p) add_package "pacman" "$OPTARG" ;;
  a) add_package "aur" "$OPTARG" ;;
  f) add_package "flatpak" "$OPTARG" ;;
  i)
    interactive_mode
    exit 0
    ;;
  *)
    echo "Usage: pkg-add [-p pacman_pkg] [-a aur_pkg] [-f flatpak_pkg] [-i interactive]"
    exit 1
    ;;
  esac
  exit 0
done

# default to interactive mode if no args provided
if [ $# -eq 0 ]; then
  interactive_mode
fi

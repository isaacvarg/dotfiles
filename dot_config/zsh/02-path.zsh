typeset -U path
path=(
  "$HOME/.local/bin"
  "$HOME/.scripts" # maybe i will remove this one and use above instead
  "/usr/bin"  
  $path
)
export PATH

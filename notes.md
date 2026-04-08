## starting system
`systemctl --user enable --now hyprpolkitagent.service`

- secure boot
`https://wiki.cachyos.org/configuration/secure_boot_setup/`
`sudo pacman -S sbctl`

## todo
- follow wiki for steam to make sure didn't forget drives etc
- have interactive to way to run scripts
- create script to install packages


## commands i ran

node and go install using mise
- `mise install node`
- `mise use node`
- `mise install go`
- `msie use go`

claude code cli
`curl -fsSL https://claude.ai/install.sh | bash`
https://code.claude.com/docs/en/overview

## app specific changes

certain apps do not use the typical dotfile way of configuration so my changes are documented here in case i forget what i like when initializing a system

### vivaldi

#### plugins
 [Raindrop](https://chromewebstore.google.com/detail/raindropio/ldgfbffkinooeloadekpmfoklnobpien)

#### general
- homepage = specific page, this is our self hosted bookmark page
- i am experimenting with starting up with the last session

#### appearance
- menu position = vivaldi butotn
- menu icon style = menu icon (so you get the sandwhich icon instead)

#### tabs
- tab bar position = left
- new tab page = homepage (the selfhosted bookmark app)
- display close button = disabled
- table handling > enable double click to close tab

#### panel
- panel position = left side

#### search

i have added a few custom searches that I use all the time
this allows me to `gr way of kings` to search goodreads or
`b hadrians wall` for board game geek

goodreads
- name = Good Reads
- nickname = gr
- URL = `https://www.goodreads.com/search?utf8=%E2%9C%93&query=%s`


#### downloads
- download location = `~/downloads`
- enable save files to default location without asking
- disable notify on completed downloads
- disable display downloads automatically


### zsh
followed this for changing the shell `https://wiki.archlinux.org/title/Command-line_shell#Changing_your_default_shell`
```bash
chsh -l
# i believe /usr/bin/zsh and /bin/zsh are symlinks
chsh -s /usr/bin/zsh

```

### mise

`echo 'eval "$(mise activate zsh)"' >> "${ZDOTDIR-$HOME}/.zshrc"`
```





# Dotfiles

👋🏽 My personal dotfiles

- This is very much a work in progress
- Managed using [Chezmoi](https://github.com/twpayne/chezmoi)
- CachyOS/Arch - Hyprland

## Scripts

### Adding Packages
This is a shell script to add the specified package to the respective file for the type of repository.

There is a separate script that checks if the packages are installed when the package files change.

```bash
# interactive mode
dots-package-add

dots-package-add -<package repository> <package name>
# packages repository flags
# -a = aur
# -p = pacman
# -f = flatpak
```

### Commend Header
Silly header that I like adding to my dotfiles.

Copies out out to the clipboard

```bash
dots-header HEADER NAME

# ┌────────────────┐
# │ ＥＸＡＭＰＬＥ │
# └────────────────┘
```

## App Specific Configurations / Notes

### Vivaldi Browser

Vivaldi requires manual configuration outside of standard dotfiles.

**Plugins**: 
- [Raindrop.io](https://chromewebstore.google.com/detail/ldgfbffkinooeloadekpmfoklnobpien?utm_source=item-share-cb)
- [1Password](https://chromewebstore.google.com/detail/khgocmkkpikpnmmkgmdnfckapcdkgfaf?utm_source=item-share-cb)

**Custom Search Engines:** 
- Goodreads: 
  - Name = Good Reads 
  - Nickname = gr  
  - URL = `https://www.goodreads.com/search?utf8=%E2%9C%93&query=%s`

- BoardGameGeek:
  - Name = Board Game Geek
  - Nickname = b
  - URL = `https://boardgamegeek.com/geeksearch.php?action=search&objecttype=boardgame&q=%s`

**Settings**

| Category   | Setting              | Preference                                |
|------------|----------------------|-------------------------------------------|
| General    | Homepage             | Self-hosted bookmark page                 |
|            | Startup              | Continue from last session                |
| Appearance | Menu Position        | Vivaldi button                            |
|            | Menu Icon Style      | Menu icon (sandwich icon)                 |
| Tabs       | Tab Bar Position     | Left                                      |
|            | New Tab Page         | Homepage (self-hosted bookmark app)       |
|            | Display Close Button | Disabled                                  |
|            | Tab Handling         | Enable double-click to close tab          |
| Panel      | Panel Position       | Left side                                 |
| Downloads  | Download Location    | ~/downloads                               |
|            | Save Files           | Save to default location without asking   |
|            | Notifications        | Disable notify on completed downloads     |
|            | Display              | Disable display downloads automatically   |


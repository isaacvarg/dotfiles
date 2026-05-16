-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")

-- FROM OLD CONFIG
-- # fixed issue i was having with hyprshot region screenshots ending up with a 1px border
-- # https://www.reddit.com/r/hyprland/comments/1eu3qdv/comment/lijb45m/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
-- layerrule = no_anim on, match:namespace hyprpicker
-- layerrule = no_anim on, match:namespace selection

-- # name: Rosé Pine Moon
-- # author: jishnurajendran
-- # upstream: https://github.com/jishnurajendran/hyprland-rosepine/blob/main/rose-pine-moon.conf
-- # All natural pine, faux fur and a bit of soho vibes for the classy minimalist
-- $base           = 0xff232136
-- $surface        = 0xff2a273f
-- $overlay        = 0xff393552
-- $muted          = 0xff6e6a86
-- $subtle         = 0xff908caa
-- $text           = 0xffe0def4
-- $love           = 0xffeb6f92
-- $gold           = 0xfff6c177
-- $rose           = 0xffea9a97
-- $pine           = 0xff3e8fb0
-- $foam           = 0xff9ccfd8
-- $iris           = 0xffc4a7e7
-- $highlightLow   = 0xff2a283e
-- $highlightMed   = 0xff44415a
-- $highlightHigh  = 0xff56526e

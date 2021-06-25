local awful = require("awful")
local helpers = require("helpers")

-- Terminal to use
terminal = "kitty"
-- Editor to use
editor = os.getenv("EDITOR") or "nano"
editor_cmd = terminal .. " " .. editor

-- Theme
theme = "test"

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- Background opacity (00 - ff)
bg_opacity = "50"

-- Time formats
clock_hours_format = "%H:%M:%S"
clock_day_format = "%d/%m/%Y"

-- Tags
tags_config = {
  max_defined_workspace = 5,
  workspaces = {
    {
      name = "Terminal",
      icon = helpers.get_icon_dir() .. "terminal.svg",
    },
    {
      name = "Code",
      icon = helpers.get_icon_dir() .. "jetbrains-toolbox.svg",
    },
    {
      name = "Internet",
      icon = helpers.get_icon_dir() .. "google-chrome.svg",
    },
    {
      name = "Discord",
      icon = helpers.get_icon_dir() .. "discord.svg",
    },
    {
      name = "Spotify",
      icon = helpers.get_icon_dir() .. "spotify.svg",
    },
  },
  default_workspace = {
    name = "Other",
    icon = helpers.get_icon_dir() .. "folder.svg",
  },
  app_to_workspace = {
    ["terminal"] = -1,
    ["discord"] = 4,
  },
}

function gen_tag_for_screen(s)
  awful.tag.add("Terminal", {
    layout = awful.layout.suit.tile,
    icon = helpers.get_icon_dir() .. "terminal.svg",
    screen = s,
    selected = true,
  })
end

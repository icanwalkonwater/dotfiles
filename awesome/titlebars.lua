local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

client.connect_signal("manage", function (c)
    if not c.fullscreen then
        c.shape = gears.shape.rounded_rect
    else
        c.shape = gears.shape.rectangle
    end
end)

client.connect_signal("property::size", function (c)
    if not c.fullscreen then
        c.shape = gears.shape.rounded_rect
    else
        c.shape = gears.shape.rectangle
    end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)

    -- buttons for the titlebar
    -- local buttons = {
    --     awful.button({ }, 1, function()
    --         c:activate { context = "titlebar", action = "mouse_move" }
    --     end),
    --     awful.button({ }, 3, function()
    --         c:activate { context = "titlebar", action = "mouse_resize" }
    --     end),
    -- }
  
    -- awful.titlebar(c).widget = {
    --   { -- Left
    --     awful.titlebar.widget.iconwidget(c),
    --     buttons = buttons,
    --     layout = wibox.layout.fixed.horizontal
    --   },
    --   { -- Middle
    --     { -- Title
    --       align = "center",
    --       widget = awful.titlebar.widget.titlewidget(c)
    --     },
    --     buttons = buttons,
    --     layout = wibox.layout.flex.horizontal
    --   },
    --   { -- Right
    --     awful.titlebar.widget.floatingbutton(c),
    --     awful.titlebar.widget.maximizedbutton(c),
    --     awful.titlebar.widget.stickybutton(c),
    --     awful.titlebar.widget.ontopbutton(c),
    --     awful.titlebar.widget.closebutton(c),
    --     layout = wibox.layout.fixed.horizontal()
    --   },
    --   layout = wibox.layout.align.horizontal
    -- }
end)

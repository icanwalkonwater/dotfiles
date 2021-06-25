local gears = require("gears")
local color = require("gears.color")
local gfs = require("gears.filesystem")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local helpers = require("helpers")
local Animation = require("awesome-AnimationFramework.Animation")

local tasklist_buttons = gears.table.join(
    awful.button({ }, 1, function(c)
      if c == client.focus then
        c.minimized = true
      else
        c:emit_signal("request::activate", "tasklist", { raise = true })
      end
    end),
    awful.button({ }, 3, function()
      awful.menu.client_list({ theme = { width = 250 } })
    end),
    awful.button({ }, 4, function()
      awful.client.focus.byidx(1)
    end),
    awful.button({ }, 5, function()
      awful.client.focus.byidx(-1)
    end)
)

screen.connect_signal("request::desktop_decoration", function(s)
  -- Create a promptbox for each screen

  s.prompt_box = awful.widget.prompt()

  local layout_list_popup = awful.popup {
    widget = wibox.widget {
      awful.widget.layoutlist {
        screen = s,
      },
      margins = 5,
      widget = wibox.container.margin,
    },
    preferred_anchors = "middle",
    shape = gears.shape.rectangle,
    visible = false,
  }

  -- Create an imagebox widget which will contain an icon indicating which layout we're using.
  -- We need one layoutbox per screen.
  s.layout_box = awful.widget.layoutbox {
    screen = s,
    buttons = {
      awful.button({ }, 1, function()
        awful.layout.inc(1)
      end),
      awful.button({ }, 3, function()
        awful.layout.inc(-1)
      end),
      awful.button({ }, 4, function()
        awful.layout.inc(-1)
      end),
      awful.button({ }, 5, function()
        awful.layout.inc(1)
      end),
    }
  }

  -- Create tag list
  s.tag_list = awful.widget.taglist {
    screen = s,
    filter = awful.widget.taglist.filter.all,
    spacing = 5,
    layout = {
      layout = wibox.layout.fixed.horizontal,
    },
    widget_template = {
      {
        {
          {
            id = "icon_role",
            resize = true,
            widget = wibox.widget.imagebox,
          },
          margins = beautiful.taglist_tag_margin,
          widget = wibox.container.margin
        },
        id = "background_role",
        widget = wibox.container.background,
      },
      -- shape = helpers.partially_rounded_rect(5, true, true),
      widget = wibox.container.background,
      create_callback = function(self, tag, index, _tags)
        local bg_el = self:get_children_by_id("background_role")[1]
        local default_bg = bg_el.bg

        self:connect_signal("mouse::enter", function()
          if not tag.selected then
            bg_el.bg = beautiful.taglist_bg_hover
          end
        end)

        self:connect_signal("mouse::leave", function()
          if not tag.selected then
            bg_el.bg = default_bg
          end
        end)
      end,
    },
    buttons = gears.table.join(
        awful.button({}, 1, function(tag)
          tag:view_only()
        end)
    ),
  }

  -- Create a tasklist widget
  s.task_list = awful.widget.tasklist {
    screen = s,
    filter = awful.widget.tasklist.filter.currenttags,
    buttons = tasklist_buttons,
    widget_template = {
      {
        {
          {
            {
              id = "icon_role",
              widget = wibox.widget.imagebox,
            },
            top = 2,
            bottom = 2,
            left = 2,
            right = 7,
            widget = wibox.container.margin,
          },
          {
            id = "text_role",
            widget = wibox.widget.textbox,
          },
          layout = wibox.layout.fixed.horizontal,
        },
        margins = 3,
        widget = wibox.container.margin,
      },
      id = "background_role",
      widget = wibox.container.background,
      update_callback = function(self, c, index, clients)
        local bg_el = self:get_children_by_id("background_role")[1]
        local default_bg = beautiful.tasklist_bg_normal

        self:connect_signal("mouse::enter", function()
          bg_el.bg = beautiful.tasklist_bg_hover
        end)

        self:connect_signal("mouse::leave", function()
          bg_el.bg = default_bg
        end)
      end,
    },
  }

  -- Keyboard map indicator and switcher
  -- hey I don't care about that
  -- local kb_layout = awful.widget.keyboardlayout()

  -- Create a textclock widget
  local clock = wibox.widget.textclock(clock_hours_format, 1)
  clock.valign = "center"
  clock.is_showing_hours = true
  clock.buttons = {
    awful.button({}, 1, function()
      if clock.is_showing_hours then
        clock.format = clock_day_format
        clock.refresh = 86400 -- 1 hour
      else
        clock.format = clock_hours_format
        clock.refresh = 1
      end

      clock.is_showing_hours = not clock.is_showing_hours
    end)
  }

  -- Create the wibox
  s.bar_bottom = awful.wibar({
    position = "bottom",
    screen = s,
    ontop = true,
    bg = beautiful.bg_normal,
  })

  -- Add widgets to the wibox
  s.bar_bottom:setup {
    layout = wibox.layout.align.horizontal,
    spacing = beautiful.bar_spacing,
    spacing_widget = {
      widget = wibox.container.background,
    },

    { -- Left widgets
      layout = wibox.layout.fixed.horizontal,
      spacing = beautiful.bar_spacing,
      spacing_widget = {
        widget = wibox.container.background
      },

      my_launcher,
      s.tag_list,
    },
    s.task_list, -- Middle widget
    { -- Right widgets
      layout = wibox.layout.fixed.horizontal,
      -- kb_layout,
      wibox.widget.systray(),
      {
        {
          {
            {
              image = helpers.get_icon_dir() .. "clock.svg",
              resize = true,
              widget = wibox.widget.imagebox,
            },
            right = 5,
            widget = wibox.container.margin,
          },
          clock,
          layout = wibox.layout.fixed.horizontal,
        },
        left = 5,
        right = 5,
        top = 4,
        bottom = 4,
        widget = wibox.container.margin,
      },
      {
        s.layout_box,
        margins = 4,
        widget = wibox.container.margin,
      },
    },
  }
end)

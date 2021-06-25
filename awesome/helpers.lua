local gears = require("gears")
local gfs = require("gears.filesystem")

local helpers = {}

helpers.get_theme_dir = function()
  return gfs.get_configuration_dir() .. "themes/" .. theme .. "/"
end

helpers.get_icon_dir = function()
  return helpers.get_theme_dir() .. "icons/"
end

helpers.rounded_rect = function(radius)
  return function(cr, width, height)
    return gears.shape.rounded_rect(cr, width, height, radius)
  end
end

helpers.partially_rounded_rect = function(radius, round_left, round_right)
  return function(cr, width, height)
    return gears.shape.partially_rounded_rect(cr, width, height, round_left, round_right, false, false, radius)
  end
end

return helpers

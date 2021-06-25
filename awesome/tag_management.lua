local awful = require("awful")
local debug = require("gears.debug")

local function get_actual_index(index)
    if index == 0 then
        return 10
    else
        return index
    end
end

local function get_tag_template_for_index(index)
    if index > tags_config.max_defined_workspace then
        return tags_config.default_workspace
    else
        return tags_config.workspaces[index]
    end
end

local function gen_tags_up_to_index(screen, index)
    local last_tag = nil
    for i=1,index do
        if screen.tags[i] == nil then
            local template = get_tag_template_for_index(i)
            last_tag = awful.tag.add(template.name, {
                layout = awful.layout.suit.tile,
                icon = template.icon,
                screen = screen,
            })
        end
    end

    return last_tag
end

awful.keyboard.append_global_keybindings({
    awful.key {
        modifiers = { modkey },
        keygroup = "numrow",
        description = "only view tag",
        group = "tag",
        on_press = function(index)
            index = get_actual_index(index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]

            if not tag then
                tag = gen_tags_up_to_index(screen, index)
            end

            tag:view_only()
        end,
    },
    awful.key {
        modifiers = { modkey, "Control" },
        keygroup = "numrow",
        description = "toggle tag",
        group = "tag",
        on_press = function(index)
            index = get_actual_index(index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]

            if not tag then
                tag = gen_tags_up_to_index(screen, index)
            end

            awful.tag.viewtoggle(tag)
        end,
    },
    awful.key {
        modifiers = { modkey, "Shift" },
        keygroup = "numrow",
        description = "move focused client to tag",
        group = "tag",
        on_press = function(index)
            index = get_actual_index(index)
            if client.focus then
                local screen = client.focus.screen
                local tag = screen.tags[index]

                if not tag then
                    tag = gen_tags_up_to_index(screen, index)
                end

                client.focus:move_to_tag(tag)
            end
        end,
    },
    awful.key {
        modifiers = { modkey, "Control", "Shift" },
        keygroup = "numrow",
        description = "toggle focused client on tag",
        group = "tag",
        on_press = function(index)
            index = get_actual_index(index)
            if client.focus then
                local screen = client.focus.screen
                local tag = client.focus.screen.tags[index]

                if not tag then
                    tag = gen_tags_up_to_index(screen, index)
                end

                client.focus:toggle_tag(tag)
            end
        end,
    },
    awful.key {
        modifiers = { modkey },
        keygroup = "numpad",
        description = "select layout directly",
        group = "layout",
        on_press = function(index)
            index = get_actual_index(index)
            local t = awful.screen.focused().selected_tag
            if t then
                t.layout = t.layouts[index] or t.layout
            end
        end,
    },
})

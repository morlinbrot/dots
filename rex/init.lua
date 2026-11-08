-- Rex configuration, migrated from Ghostty and kitty.

-- Ghostty (~/.config/ghostty/config)
rex.bind("ctrl+shift+'", "pane.split", { direction = "down" })          -- :34
rex.bind("ctrl+shift+k", "client.prompt.previous")                     -- :48
rex.bind("ctrl+shift+j", "client.prompt.next")                         -- :49
rex.bind("ctrl+shift+cmd+=", "pane.balance")                           -- :43
rex.bind("ctrl+shift+cmd+l", "pane.resize", { direction = "right" })   -- :39
rex.bind("ctrl+shift+cmd+h", "pane.resize", { direction = "left" })    -- :40
rex.bind("ctrl+shift+cmd+k", "pane.resize", { direction = "up" })      -- :41
rex.bind("ctrl+shift+cmd+j", "pane.resize", { direction = "down" })    -- :42
rex.bind("ctrl+shift+u", "client.scroll.page_up")                      -- :46 (full page; Rex has no half-page scroll)
rex.bind("ctrl+shift+d", "client.scroll.page_down")                    -- :47

-- kitty (~/.config/kitty/kitty.conf, kitty_mod = ctrl+shift)
rex.bind("ctrl+shift+enter", "pane.split", { direction = "auto" })     -- :40
rex.bind("ctrl+shift+n", "pane.focus_next")                            -- :47
rex.bind("ctrl+shift+p", "pane.focus_previous")                        -- :48
rex.bind("ctrl+shift+f", "pane.zoom")                                  -- :78

-- Option+key as Alt for terminal programs, same as the `keybind = alt+…=esc:…` lines in
-- ghostty/config. Option keeps typing special characters (like ü) for every other key.
local terminal = "com.superlogical.terminal"
local function type_into_terminal(data)
    return function(ctx)
        -- Leaving block_id out targets the current block. If it isn't a terminal,
        -- the call fails and the key is passed on unhandled.
        local result = rex.block.call(terminal, "write", { block_id = ctx.block_id, data = data })
        return result ~= nil
    end
end

local alt_keys = {
    ["backspace"] = "\27\127", -- Word deletion
    ["b"] = "\27b",            -- Word movement
    ["f"] = "\27f",
    ["d"] = "\27d",
    ["."] = "\27.",            -- Insert last arg of previous command (shell) / repeat last find (helix)
    ["h"] = "\27h",            -- Buffer switching in Helix
    ["l"] = "\27l",
    ["o"] = "\27o",            -- Cross-buffer history jumps in Runyte
    ["i"] = "\27i",
}
for key, data in pairs(alt_keys) do
    rex.bind("alt+" .. key, type_into_terminal(data))
end

local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- region: Settings
config.color_scheme = "Catppuccin Mocha"
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 15
config.default_cursor_style = "BlinkingBar"
config.window_frame = { font_size = 14 }

-- config.default_cwd = wezterm.home_dir .. "/dots"
-- Log key events. Launch wezterm from another terminal to see the output.
-- config.debug_key_events = true
-- endregion: Settings

-- region: Keybindings
config.leader = { key = "Space", mods = "CTRL" }

local act = wezterm.action

config.keys = {
    -- Pane management
    { key = "mapped:>", mods = "CTRL|SHIFT",     action = act.ActivateTabRelative(1) },
    { key = "mapped:<", mods = "CTRL|SHIFT",     action = act.ActivateTabRelative(-1) },
    { key = "mapped:>", mods = "CTRL|SHIFT|ALT", action = act.MoveTabRelative(1) },
    { key = "mapped:<", mods = "CTRL|SHIFT|ALT", action = act.MoveTabRelative(-1) },
    { key = "n",        mods = "CTRL|SHIFT",     action = act.ActivatePaneDirection "Next" },
    { key = "p",        mods = "CTRL|SHIFT",     action = act.ActivatePaneDirection "Prev" },
    { key = "Enter",    mods = "CTRL|SHIFT",     action = act.SplitPane { direction = "Right" } },
    { key = '"',        mods = "CTRL|SHIFT",     action = act.SplitPane { direction = "Down" } },
    { key = "f",        mods = "CTRL|SHIFT",     action = act.TogglePaneZoomState },

    -- Use VSCode keybind and free up "CTRL|SHIFT p" for pane switching.
    { key = "p",        mods = "CMD|SHIFT",      action = act.ActivateCommandPalette },

    -- Scrollback
    { key = 'k',        mods = 'CTRL|SHIFT',     action = act.ScrollByLine(-1) },
    { key = 'j',        mods = 'CTRL|SHIFT',     action = act.ScrollByLine(1) },
    { key = 'k',        mods = 'ALT|CTRL|SHIFT', action = act.ScrollToPrompt(-1) },
    { key = 'j',        mods = 'ALT|CTRL|SHIFT', action = act.ScrollToPrompt(1) },

    -- Custom key tables
    {
        key = 'r',
        mods = 'LEADER',
        action = act.ActivateKeyTable {
            name = 'resize_pane',
            one_shot = false,
        },
    },
    {
        key = 's',
        mods = 'LEADER',
        action = act.ActivateKeyTable {
            name = 'split_pane',
        },
    },

}
-- endregion: Keybindings

-- region: Custom key tables
config.key_tables = {
    resize_pane = {
        { key = 'h',      action = act.AdjustPaneSize { 'Left', 1 } },
        { key = 'l',      action = act.AdjustPaneSize { 'Right', 1 } },
        { key = 'k',      action = act.AdjustPaneSize { 'Up', 1 } },
        { key = 'j',      action = act.AdjustPaneSize { 'Down', 1 } },

        { key = 'Escape', action = 'PopKeyTable' },
        { key = 'Space',  action = 'PopKeyTable' },
        { key = 'Enter',  action = 'PopKeyTable' },
    },
    split_pane = {
        { key = 'h', action = act.SplitPane { direction = 'Left' } },
        { key = 'l', action = act.SplitPane { direction = 'Right' } },
        { key = 'k', action = act.SplitPane { direction = 'Up' } },
        { key = 'j', action = act.SplitPane { direction = 'Down' } },
    }
}
-- endregion: Custom key tables

-- region: Mouse bindings
config.mouse_bindings = {
    {
        event = { Down = { streak = 3, button = 'Left' } },
        action = wezterm.action.SelectTextAtMouseCursor 'SemanticZone',
        mods = 'NONE',
    },
}
-- endregion: Mouse bindings

-- region: Status area
wezterm.on("update-status", function(window, pane)
    local status = ''

    local render_status = function(s)
        local cells = {}
        cells[#cells + 1] = { Background = { Color = 'hsla(0, 0, 0, .05)' } }
        cells[#cells + 1] = { Text = s }
        return wezterm.format(cells)
    end

    -- Show which key table is active in the status area
    local active_key_table = window:active_key_table()
    if active_key_table == 'resize_pane' then
        status = status .. ' 📐 '
    elseif active_key_table == 'split_pane' then
        status = status .. ' ✂️ '
    end

    -- Show an indicator when a pane is zoomed
    local our_tab = pane:tab()
    local is_zoomed = false
    if our_tab ~= nil then
        for _, pane_attributes in pairs(our_tab:panes_with_info()) do
            is_zoomed = pane_attributes['is_zoomed'] or is_zoomed
        end
    end
    if is_zoomed then
        status = status .. ' 🧭 '
    end

    window:set_right_status(render_status(status))
end)
-- endregion: Status area


-- region: modal.wezterm Vim-style copy mode
-- local modal = wezterm.plugin.require("https://github.com/MLFlexer/modal.wezterm")
-- modal.apply_to_config(config)
-- modal.set_default_keys(config)
-- endregion: modal.wezterm Vim-style copy mode

-- region: Startup script
local mux = wezterm.mux
wezterm.on("gui-startup", function(cmd)
    local args = {}
    if cmd then
        args = cmd.args
    end

    local dots_dir = wezterm.home_dir .. "/dots"
    local dots_tab, editor_pane, window = mux.spawn_window({
        cwd = dots_dir,
        args = args,
    })

    window:gui_window():maximize()

    editor_pane:send_text "hx .\n"

    local git_pane = editor_pane:split {
        size = 0.3,
        cwd = dots_dir,
    }

    git_pane:send_text "git status\n"

    editor_pane:activate()

    local prx_dir = wezterm.home_dir .. "/prx"
    local prx_tab, prx_pane, window = window:spawn_tab {
        cwd = prx_dir
    }

    prx_pane:send_text "xla\n"
end)
-- endregion: Startup script

return config

local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Mocha"

config.font = wezterm.font("IosevkaTerm NF")
config.font_size = 16

config.default_cursor_style = "BlinkingBar"
config.use_fancy_tab_bar = false

-- config.default_cwd = wezterm.home_dir .. "/dots"

-- Log key events. Launch wezterm from another terminal to see the output.
config.debug_key_events = true

-- region: Keybindings
local act = wezterm.action
config.keys = {
  -- Pane management
  { key = "mapped:>", mods = "CTRL|SHIFT", action = act.ActivateTabRelative(1) },
  { key = "mapped:<", mods = "CTRL|SHIFT", action = act.ActivateTabRelative(-1) },
  { key = "mapped:>", mods = "CTRL|SHIFT|ALT", action = act.MoveTabRelative(1) },
  { key = "mapped:<", mods = "CTRL|SHIFT|ALT", action = act.MoveTabRelative(-1) },
  { key = "n", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection "Next" },
  { key = "p", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection "Prev" },
  { key = "Enter", mods = "CTRL|SHIFT", action = act.SplitPane { direction = "Right" } },

 -- Use VSCode keybind and ree up "CTRL|SHIFT p" for pane switching.
  { key = "p", mods = "CMD|SHIFT", action = act.ActivateCommandPalette },

  -- Scrollback
  { key = 'k', mods = 'CTRL|SHIFT', action = act.ScrollByLine(-1) },
  { key = 'j', mods = 'CTRL|SHIFT', action = act.ScrollByLine(1) },
  { key = 'k', mods = 'ALT|CTRL|SHIFT', action = act.ScrollToPrompt(-1) },
  { key = 'j', mods = 'ALT|CTRL|SHIFT', action = act.ScrollToPrompt(1) },
}


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

return config

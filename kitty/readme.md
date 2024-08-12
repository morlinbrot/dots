## Install a new theme
- Place theme file in `dots/kitty/themes/my-new-theme.conf`

- Update the `dotbot.default.yaml` to symlink to the new file:
```
~/.config/kitty/current-theme.conf: kitty/themes/my-new-theme.conf
```

- Run the default dotbot install with `./install`


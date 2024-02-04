# Transform zsh-style aliases to nushell-style
# Usage: `open input.txt | lines | alias_zsh_to_nu | save aliases.nu`
export def alias_zsh_to_nu [] -> list<string> {
  # Surround equal sign with spaces
  str replace -r "=['\"]" " = " 
  # Any ' or " preceeded by char, succeeded by hash or space+hash
  | str replace -r "\\w*['\"]\\s*#" " #" 
  # Remove the last ' or " at the end of line
  | str replace -r "['\"]$" "" 
  | each {|l| $"export ($l)"}
}

# Find zsh-style aliases in the input
# Usage: `open .zshrc | alias_find_zsh | alias_zsh_to_nu | save aliases.nu`
export def alias_find_zsh [] -> list<string> {
  lines | find -r "^alias\\s{1}\\w+[=]['\"].+['\"]"
}

# Read env vars from current login shell and set them on the Nushell environment.
export def copy_env_vars [] {
  $env | reject config | transpose key val | each {|r| echo $"$env.($r.key) = '($r.val)'"} | str join (char nl)
}

# Return a string statement appending `input` to `$env.PATH`.
# Usage: append_to_path_str "/some/path" | save ~/dots/nushell/config.nu
export def append_to_path_str [input: string] -> string {
  $"$env.PATH = \($env.PATH | split row \(char esep\) | append '($input)'\)"
}

# Extract `export PATH=` definitions from the input.
# Usage: open .zshrc | copy_path_vars | each { |it| append_to_path_str $it }
export def extract_path_vars [] {
  lines | find -r "^export PATH" | str replace -r "^export PATH=\"" "" | str replace "$PATH:" "" | str replace ":$PATH" "" | str replace -r "\"$" ""
}

# Extract `export PATH=` statements from a file and write an append-to-path-statement to env.nu for each. Must be run in ~/dots directory.
export def extract_and_append_path_vars [filename] {
  open $filename | extract_path_vars | each { |it| append_to_path_str $it } | insert 0 "" | save --append nushell/env.nu
}

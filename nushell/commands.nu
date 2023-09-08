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

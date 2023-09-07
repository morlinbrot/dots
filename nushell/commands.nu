# Transform zsh-style alias statements to nushell-style
export def zsh_to_nu_aliases [
  in_file: string # Input file name
] -> list<string> {
  open $in_file | lines -s | str replace "=" " = " | str replace -a "'" "" | each {|l| if $l !~ "^#" {$"export ($l)"} else {$"\n($l)"}}
}
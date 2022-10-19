# Decided to not use this for now, since it's actually not the best idea to randomly source
# stuff from files in any dir you enter, but keeping this for reference.
#
# On changing the PWD, this will read the contents of .env files into global env vars. 
# Adapted from https://github.com/fish-shell/fish-shell/issues/6901
#function read_dot_env --on-variable PWD
#    if test -r .env
#        while read -la line
#            set -l kv (string split -m 1 = -- $line)
#            set -gx $kv # this will set the variable named by $kv[1] to the rest of $kv
#        end < .env
#   end
#end
